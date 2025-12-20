import { spawnSync } from "node:child_process";
import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const repoRoot = path.resolve(__dirname, "..");

function die(message) {
  console.error(message);
  process.exit(1);
}

function readJson(filePath) {
  return JSON.parse(fs.readFileSync(filePath, "utf8"));
}

function ensureDir(dirPath) {
  fs.mkdirSync(dirPath, { recursive: true });
}

function stringifyDefineValue(value) {
  if (typeof value === "string") return JSON.stringify(value);
  if (typeof value === "number") return String(value);
  if (typeof value === "boolean") return value ? "true" : "false";
  return JSON.stringify(value);
}

function runOpenScad({
  appImagePath,
  scadPath,
  outPath,
  format,
  img,
  defines,
}) {
  const args = ["-o", outPath];

  if (format === "png") {
    args.push("--imgsize", `${img.size[0]},${img.size[1]}`);
    args.push("--projection", img.projection);
  }

  for (const [key, value] of Object.entries(defines ?? {})) {
    args.push("-D", `${key}=${stringifyDefineValue(value)}`);
  }

  args.push(scadPath);

  const result = spawnSync(appImagePath, args, {
    cwd: repoRoot,
    env: {
      ...process.env,
      APPIMAGE_EXTRACT_AND_RUN: "1",
    },
    encoding: "utf8",
  });

  const combined = `${result.stdout ?? ""}\n${result.stderr ?? ""}`.trim();
  const hasWarnOrErr = /(\bWARNING\b|\bERROR\b|\bDEPRECATED\b)/i.test(combined);

  if (result.status !== 0) {
    return { ok: false, output: combined, status: result.status ?? -1 };
  }

  if (hasWarnOrErr) {
    return { ok: false, output: combined, status: 0 };
  }

  return { ok: true, output: combined, status: 0 };
}

function usage() {
  console.log(
    [
      "Usage:",
      "  node scripts/scad-export.mjs validate [--id <targetId>]",
      "  node scripts/scad-export.mjs release  [--id <targetId>]",
      "  node scripts/scad-export.mjs check",
    ].join("\n")
  );
}

const manifestPath = path.join(repoRoot, "export.manifest.json");
if (!fs.existsSync(manifestPath)) die("Missing export.manifest.json");

const manifest = readJson(manifestPath);
const appImagePath = path.join(
  repoRoot,
  "bin",
  "OpenSCAD-2025.12.17.ai30001-x86_64.AppImage"
);
if (!fs.existsSync(appImagePath))
  die(`Missing pinned OpenSCAD AppImage at ${appImagePath}`);

const cmd = process.argv[2] ?? "validate";
const args = process.argv.slice(3);

let onlyId = null;
for (let i = 0; i < args.length; i++) {
  if (args[i] === "--id") {
    onlyId = args[i + 1] ?? null;
  }
}

if (cmd === "-h" || cmd === "--help") {
  usage();
  process.exit(0);
}

if (!Array.isArray(manifest.targets) || manifest.targets.length === 0) {
  die("Manifest has no targets");
}

const img = manifest.img ?? { size: [1200, 900], projection: "o" };
const outputsDir = path.join(repoRoot, manifest.outputsDir ?? "out");

function selectedTargets() {
  const targets = onlyId
    ? manifest.targets.filter((t) => t.id === onlyId)
    : manifest.targets;

  if (onlyId && targets.length === 0) {
    die(`No target with id=${onlyId}`);
  }

  return targets;
}

function exportTargets(mode) {
  const modeDir = path.join(outputsDir, mode);
  ensureDir(modeDir);

  const targets = selectedTargets();
  let failed = 0;

  for (const target of targets) {
    const targetDir = path.join(modeDir, target.id);
    ensureDir(targetDir);

    const scadPath = path.join(repoRoot, target.path);
    if (!fs.existsSync(scadPath)) {
      console.error(`Missing target file: ${target.path}`);
      failed++;
      continue;
    }

    const formats = mode === "validate" ? ["png"] : target.formats;
    for (const format of formats) {
      const outPath = path.join(targetDir, `${target.id}.${format}`);
      const result = runOpenScad({
        appImagePath,
        scadPath,
        outPath,
        format,
        img,
        defines: target.defines,
      });

      if (!result.ok) {
        console.error(`FAIL ${mode} ${target.id} -> ${format}`);
        if (result.output) console.error(result.output);
        failed++;
      } else {
        console.log(`OK   ${mode} ${target.id} -> ${format}`);
      }
    }
  }

  if (failed > 0) {
    die(`${failed} export(s) failed`);
  }
}

function runChecks() {
  const checks = manifest.checks ?? {};
  const includeNoGeometry = checks.includeNoGeometry ?? [];

  if (!Array.isArray(includeNoGeometry)) {
    die("checks.includeNoGeometry must be an array");
  }

  const checkDir = path.join(outputsDir, "_checks");
  ensureDir(checkDir);

  let failed = 0;
  for (const relPath of includeNoGeometry) {
    const absPath = path.join(repoRoot, relPath);
    if (!fs.existsSync(absPath)) {
      console.error(`Missing check file: ${relPath}`);
      failed++;
      continue;
    }

    const slug = relPath
      .replaceAll("/", "__")
      .replaceAll(".", "_")
      .replaceAll("-", "_");

    const scadCheckPath = path.join(
      checkDir,
      `include_no_geometry__${slug}.scad`
    );
    const stlOutPath = path.join(checkDir, `include_no_geometry__${slug}.stl`);

    const includePath = absPath.replaceAll(path.sep, "/");
    fs.writeFileSync(scadCheckPath, `include <${includePath}>;\n`);

    const result = runOpenScad({
      appImagePath,
      scadPath: scadCheckPath,
      outPath: stlOutPath,
      format: "stl",
      img,
      defines: {},
    });

    // If the include emits geometry at top level, OpenSCAD will usually not report an empty object.
    const output = result.output ?? "";
    const indicatesEmpty = /top level object is empty/i.test(output);
    const hasWarnOrErr = /(\bWARNING\b|\bERROR\b|\bDEPRECATED\b)/i.test(output);

    if (hasWarnOrErr || !indicatesEmpty) {
      console.error(`FAIL check include-no-geometry: ${relPath}`);
      if (result.output) console.error(result.output);
      failed++;
    } else {
      console.log(`OK   check include-no-geometry: ${relPath}`);
    }
  }

  if (failed > 0) {
    die(`${failed} check(s) failed`);
  }
}

switch (cmd) {
  case "validate":
    exportTargets("validate");
    break;
  case "release":
    exportTargets("release");
    break;
  case "check":
    runChecks();
    break;
  default:
    usage();
    die(`Unknown command: ${cmd}`);
}
