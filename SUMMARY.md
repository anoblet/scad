# scad — Repository Summary

Parametric OpenSCAD models for 3D printing, organized as a set of reusable packages under `packages/`, with reproducible exports via a pinned OpenSCAD AppImage and a vendored BOSL2 library.

## What this repo is for

- **Design**: keep models parametric (sensible defaults, named dimensions, minimal magic numbers).
- **Reuse**: shared defaults and helpers live in `packages/common/` and `packages/modules/`.
- **Reproducible exports**: exports use the pinned OpenSCAD AppImage in `bin/` so CI and local renders match.

Key modeling assumptions (repo-wide):

- Units are **millimeters**.
- **Z is up**.

## Quick start (common workflows)

All workflows write outputs under `out/` (gitignored).

- **Validate** (PNG only, fast): `npm run scad:validate`
- **Release** (PNG + STL): `npm run scad:release`
- **Library checks** (include-time geometry gates): `npm run scad:check`
- **Inventory snapshot** (contract stats): `npm run scad:inventory`

Run a single export target by id:

- `npm run scad:validate -- --id tray-coffee`
- `npm run scad:release -- --id tray-coffee`

## Repository layout

- `packages/` — the OpenSCAD “product” surface area (individual model packages).
- `packages/common/` — repo-wide defaults and shared includes.
- `packages/modules/` — internal reusable modules intended for `use` (no include-time geometry).
- `lib/BOSL2/` — vendored BOSL2 dependency (canonical include path in this repo).
- `scripts/` — Node.js tooling for exporting and inventory.
- `docs/` — conventions and operational docs.
- `bin/` — pinned OpenSCAD AppImage used by the exporter.
- `export.manifest.json` — explicit list of export targets + checks.
- `copilot/` + `link.json` — embedded “agent framework”/tooling overlay (secondary to the SCAD models).

## Exporting (how artifacts are produced)

Exports are driven by `scripts/scad-export.mjs` using the pinned AppImage at:

- `bin/OpenSCAD-2025.12.17.ai30001-x86_64.AppImage`

The exporter sets `APPIMAGE_EXTRACT_AND_RUN=1` to work in environments without FUSE.

### Export manifest

`export.manifest.json` defines:

- `targets[]`: each target has an `id`, a `path` to a `.scad` file under `packages/`, optional `defines`, and `formats`.
- `checks.includeNoGeometry[]`: SCAD files that must not emit geometry at include-time (primarily under `packages/modules/`).

Output layout:

- `out/<mode>/<targetId>/<targetId>.png`
- `out/<mode>/<targetId>/<targetId>.stl`

Where `<mode>` is `validate` (PNG only) or `release` (all formats).

### Current strictness note

Today, the exporter treats `WARNING` / `DEPRECATED` / `ERROR` in OpenSCAD output as failures (even when the process exit status is 0). That is the current behavior of `scripts/scad-export.mjs` and is also documented in `docs/exporting.md`.

If you don’t want “warnings as failures”, this behavior likely needs to be relaxed in the exporter (and the docs updated to match).

## Modeling conventions (current reality + intended direction)

The repo has a documented “package contract” in `docs/scad-contract.md`. Adoption is partial across `packages/` (see `docs/package-inventory.md`).

### Includes: model vs library

- **Exportable models** should prefer:
  - `include <../common/common.scad>` (or `include <../../common/common.scad>` if deeper)
- **Library code / reusable modules** should prefer:
  - `use <../common/common_use.scad>` (or `use <../../common/common_use.scad>`)

Why:

- `common.scad` applies repo defaults (including tessellation policy) and imports common BOSL2 wiring.
- `common_use.scad` is intended to be **side-effect-free** and safe for libraries.

### Tessellation policy

Repo defaults live in `packages/common/common.scad`:

- Preview: coarser tessellation for faster iteration.
- Export: finer defaults.

Many existing packages still override `$fa/$fs/$fn` directly (tracked by the inventory). The contract direction is: avoid global overrides; if needed, override locally inside `main()`.

### Entrypoint convention

The contract recommends:

- `module main() { ... }`
- `main();` at EOF

Only a small subset of current packages follow this strictly (tracked in `docs/package-inventory.md`).

## Internal reusable modules (`packages/modules/`)

This directory is intended to hold **use-only** helpers and small building blocks.

- Import aggregator: `use <../modules/modules.scad>`
- Rules: no include-time geometry and no global tessellation mutations.

These rules are enforced via `npm run scad:check`, which generates tiny “include check” SCAD files and verifies the include produces an empty top-level object.

## How to add a new model/package

1. Create a new `.scad` file under `packages/<your-package>/...`.
2. Import repo defaults:
   - `include <../common/common.scad>` (adjust `../` depth as needed)
3. Prefer the contract-style entrypoint:
   - define `module main() { ... }`
   - call `main();` at EOF
4. If you need shared internal primitives, import them with `use <../modules/modules.scad>`.
5. Add your model to `export.manifest.json`:
   - Policy: **new packages should be added by default** (so they get validated/released).
6. Run the workflow locally:
   - `npm run scad:check`
   - `npm run scad:validate -- --id <your-id>`
   - `npm run scad:release -- --id <your-id>`

## Tooling and automation (secondary)

This repo includes an embedded agent framework under `copilot/`. The `link.json` file indicates that `.github/` and `.vscode/` overlays are managed from that framework (avoid hand-editing overlay targets; update the source in `copilot/` instead).

## Pointers

- Conventions/contract: `docs/scad-contract.md`
- Export workflow: `docs/exporting.md`
- Internal modules guidance: `docs/modules.md`
- Current package inventory snapshot: `docs/package-inventory.md`
