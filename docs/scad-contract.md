# SCAD Package Contract

## Imports

- **Exportable models**: `include <../common/common.scad>` (or `include <../../common/common.scad>` when deeper).
- **Library files** (reusable modules): prefer `use <../common/common_use.scad>` (or `use <../../common/common_use.scad>` when deeper).
- **When a model needs extra BOSL2 modules**: prefer a small wrapper include under `packages/common/` (example: `packages/common/common_threading.scad`) instead of `include <BOSL2/...>`.

Notes:

- Prefer `use` for libraries so they cannot accidentally rely on include-time globals.
- Models should `include` the model-common file so they receive repo defaults (including tessellation policy).

## Entrypoint

- Exportable models should expose `module main() { ... }` and call `main();` at EOF.
- Files under `packages/modules/` must not emit geometry at include-time.

## Tessellation

- Global defaults are set in `packages/common/common.scad` based on `$preview`.
- Avoid top-level `$fn/$fa/$fs` overrides in models and libraries.
- If a model needs higher quality, apply overrides _locally_ inside `main()` (for example via a `fn_override` parameter).

## Units and Axes

- Units are millimeters.
- Z is up.
