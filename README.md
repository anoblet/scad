# scad

Parametric OpenSCAD models for 3D printing.

This repo vendors BOSL2 under `lib/BOSL2/` and exports via the pinned OpenSCAD AppImage in `bin/` to keep CI/local outputs reproducible.

## Quick start

- Library checks (include-time geometry gates): `npm run scad:check`
- Validate (PNGs only, fast): `npm run scad:validate`
- Release (STL + PNG): `npm run scad:release`
- Inventory snapshot (contract stats): `npm run scad:inventory`

Outputs are written under `out/` (gitignored).

To run a single export target, pass an id:

- Validate one: `npm run scad:validate -- --id tray-coffee`
- Release one: `npm run scad:release -- --id tray-coffee`

## Docs

- Contract and conventions: `docs/scad-contract.md`
- Internal reusable modules: `docs/modules.md`
- Exporting and manifest workflow: `docs/exporting.md`
- Current repo inventory snapshot: `docs/package-inventory.md`
