# Internal Modules (`packages/modules/`)

## Usage

From an exportable model under `packages/<pkg>/...`, prefer `use` when importing the modules library:

```scad
use <../modules/modules.scad>;          // packages/<pkg>/...
// use <../../modules/modules.scad>;   // deeper packages/<pkg>/<subdir>/...

// Example: a reusable primitive
open_top_cuboid_shell(size=[50, 30, 12], wall=2);
```

## Rules

- No include-time geometry.
- No top-level `$fn/$fa/$fs` mutations.
- Provide clear module/function APIs with sensible defaults.

## Structure

- `packages/modules/primitives/`: small composable building blocks.
- `packages/modules/assemblies/`: larger composed parts.
- `packages/modules/modules.scad`: index aggregator (use-only).

## Current Utilities

- `primitives/hollow_shell.scad`: `open_top_cuboid_shell(...)`
- `assemblies/threaded_standoff.scad`: `threaded_standoff(...)`
- `shaft.scad`: `shaft_28byj48(...)` + alias `shaft(...)`
