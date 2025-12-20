import fs from "node:fs";
import path from "node:path";
import { fileURLToPath } from "node:url";

const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);
const repoRoot = path.resolve(__dirname, "..");

function walk(dir) {
  const entries = fs.readdirSync(dir, { withFileTypes: true });
  const out = [];
  for (const entry of entries) {
    const full = path.join(dir, entry.name);
    if (entry.isDirectory()) out.push(...walk(full));
    else out.push(full);
  }
  return out;
}

function read(file) {
  return fs.readFileSync(file, "utf8");
}

function stripComments(text) {
  // Remove /* */ blocks first, then // line comments.
  return text.replace(/\/\*[\s\S]*?\*\//g, "").replace(/\/\/.*$/gm, "");
}

function rel(file) {
  return path.relative(repoRoot, file).replaceAll(path.sep, "/");
}

const packagesDir = path.join(repoRoot, "packages");
const scadFiles = walk(packagesDir).filter((f) => f.endsWith(".scad"));

const stats = {
  total: scadFiles.length,
  includesCommon: [],
  includesBosl2Angle: [],
  overridesFaFsFn: [],
  hasMainModule: [],
  callsMainAtEof: []
};

for (const file of scadFiles) {
  const text = stripComments(read(file));
  const r = rel(file);

  if (/include\s*<(\.\.\/)+common\/common\.scad>/i.test(text)) {
    stats.includesCommon.push(r);
  }

  if (/include\s*<BOSL2\//.test(text)) {
    stats.includesBosl2Angle.push(r);
  }

  if (/\$(fa|fs|fn)\s*=/.test(text)) {
    stats.overridesFaFsFn.push(r);
  }

  if (/module\s+main\s*\(/.test(text)) {
    stats.hasMainModule.push(r);
  }

  if (/\bmain\s*\(\s*\)\s*;\s*$/m.test(text)) {
    stats.callsMainAtEof.push(r);
  }
}

stats.includesCommon.sort();
stats.includesBosl2Angle.sort();
stats.overridesFaFsFn.sort();
stats.hasMainModule.sort();
stats.callsMainAtEof.sort();

function section(title, list) {
  const lines = [];
  lines.push(`## ${title} (${list.length})`);
  if (list.length === 0) {
    lines.push("(none)");
    return lines.join("\n");
  }
  for (const item of list) lines.push(`- ${item}`);
  return lines.join("\n");
}

const md = [
  "# Package Contract Inventory",
  "",
  `Generated: ${new Date().toISOString()}`,
  "",
  `Total .scad files under packages/: ${stats.total}`,
  "",
  section("Includes packages/common/common.scad (any depth)", stats.includesCommon),
  "",
  section("Includes <BOSL2/...> (legacy angle-bracket imports)", stats.includesBosl2Angle),
  "",
  section("Overrides $fa/$fs/$fn (any assignment)", stats.overridesFaFsFn),
  "",
  section("Defines module main()", stats.hasMainModule),
  "",
  section("Calls main(); (line-end match)", stats.callsMainAtEof)
].join("\n");

const outPath = path.join(repoRoot, "docs", "package-inventory.md");
fs.mkdirSync(path.dirname(outPath), { recursive: true });
fs.writeFileSync(outPath, md);

console.log(`Wrote ${rel(outPath)}`);
