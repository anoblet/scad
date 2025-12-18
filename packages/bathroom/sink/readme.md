# Bathroom Sink Drain Plug (Parametric)

## Prompt

```markdown
Generate a fully functionable drain plug for a US sink. Use concentric circles to filter the water. Use a cross to allow the model to be 3D printed. The model should be upside down with the base on the bottom. Use the executable in the (bin) folder to render the model. Evaluate the rendered image of the model. Iterrate until you have statisfied all of the requirements. Place your generated script in (packages/bathroom/sink/drain.scad). Use the OpenSCAD executable to create a PNG, and STL file of the model.
```

## Overview

This folder contains a parametric sink drain plug/strainer intended for FDM printing.

- Source: `drain.scad`
- Primary module: `drain_plug(...)`
- Convenience entrypoint: `main()`

The geometry uses concentric annular slots with a solid cross to keep the part printable and mechanically supported.

## Preview

![Rendered preview of the default drain plug](drain.png)

## Files

- `drain.scad` — source (OpenSCAD)
- `drain.png` — rendered preview image (generated)
- `drain.stl` — exported mesh (generated; can be very large)

## Dependencies

- `drain.scad` includes `../../common/common.scad`, which includes BOSL2 (`lib/BOSL2/std.scad`) and sets `$fa/$fs` based on `$preview`.
- Prefer `use <...>` when consuming this model so `main();` at the bottom of `drain.scad` does not auto-render in your own file.

## API

### `drain_plug(...)`

```scad
/**
 * Parametric sink drain plug/strainer.
 *
 * Creates a circular filter plate (concentric ring slots + solid cross), a tapered insertion stem,
 * and an optional pull handle.
 *
 * Units are millimeters.
 *
 * @param preset Preset name that provides computed defaults when certain parameters are left `undef`.
 * @default "bathroom"
 *
 * @param flange_d Outer diameter of the filter plate/flange.
 * @default undef
 * @remarks If `undef`, computed from `preset`:
 * - `"bathroom"`: 54
 * - `"kitchen"`: 112
 *
 * @param flange_th Thickness of the filter plate.
 * @default 2.4
 * @remarks Must satisfy: `flange_th >= 1.6` (asserted).
 *
 * @param rim_w Solid outer rim width (no slots) around the flange.
 * @default 3.0
 * @remarks Larger `rim_w` reduces slot area; too large may violate the pattern-density assertion.
 *
 * @param insert_d Diameter of the insertion stem at the flange interface (before taper).
 * @default undef
 * @remarks If `undef`, computed from `preset`:
 * - `"bathroom"`: 39.5
 * - `"kitchen"`: 86.5
 *
 * @param insert_h Height of the insertion stem.
 * @default undef
 * @remarks If `undef`, computed from `preset`:
 * - `"bathroom"`: 10
 * - `"kitchen"`: 16
 *
 * @param insert_taper Total diameter reduction applied across the stem height.
 * @default 0.8
 * @remarks The stem uses `d2 = max(insert_d - 2*insert_taper, 1)`.
 *
 * @param insert_chamfer Bottom chamfer on the stem (at the taper start).
 * @default 0.8
 *
 * @param slot_w Radial thickness of each annular slot band.
 * @default 1.6
 *
 * @param web_w Radial thickness of material between annular slots.
 * @default 1.4
 * @remarks Together with `slot_w` this forms the slot pitch (`slot_w + web_w`).
 *
 * @param spoke_w Width of the solid cross that remains uncut through the slots.
 * @default 3.0
 *
 * @param hub_d Diameter of the solid center hub.
 * @default 12
 *
 * @param handle_d Diameter of the pull handle cylinder.
 * @default 14
 *
 * @param handle_h Height of the pull handle cylinder. Set to `0` to disable.
 * @default 6
 *
 * @param handle_chamfer Edge chamfer on the pull handle cylinder.
 * @default 1.0
 *
 * @remarks Constraints (asserted):
 * - Let `pattern_ro = (flange_d/2) - rim_w`. Then `pattern_ro > (hub_d/2 + slot_w + web_w)`.
 *   If violated, the slot pattern is too dense for the available radial space.
 */
module drain_plug(
		preset="bathroom",

		flange_d=undef,
		flange_th=2.4,
		rim_w=3.0,

		insert_d=undef,
		insert_h=undef,
		insert_taper=0.8,
		insert_chamfer=0.8,

		slot_w=1.6,
		web_w=1.4,
		spoke_w=3.0,
		hub_d=12,

		handle_d=14,
		handle_h=6,
		handle_chamfer=1.0
) {
		// ...implementation in drain.scad...
}
```

### `main()`

```scad
/**
 * Convenience entrypoint used for previewing the model.
 *
 * @remarks `drain.scad` ends with `main();` so opening the file renders a default `drain_plug()`.
 */
module main();
```

## Usage Examples

### Typical bathroom sink plug (preset defaults)

```scad
use <packages/bathroom/sink/drain.scad>;

drain_plug(preset="bathroom");
```

### Kitchen sink preset (larger flange + stem defaults)

```scad
use <packages/bathroom/sink/drain.scad>;

drain_plug(preset="kitchen");
```

### Tuned fit (override computed defaults)

```scad
use <packages/bathroom/sink/drain.scad>;

drain_plug(
	preset="bathroom",
	insert_d=40.2,      // loosen/tighten stem fit
	insert_taper=1.2,   // add more taper if needed
	flange_th=2.8,
	handle_h=0          // disable handle
);
```

## Notes

- If you export extremely large STL files, it may be due to very fine `$fa/$fs` defaults from `common.scad` when `$preview` is false. Override `$fa`/`$fs` in your top-level script if needed.

## Exporting

The repo includes a pinned OpenSCAD AppImage in `bin/`. In minimal environments without FUSE, prefix commands with `APPIMAGE_EXTRACT_AND_RUN=1`.

### Export STL

```sh
APPIMAGE_EXTRACT_AND_RUN=1 \
	bin/OpenSCAD-2025.12.17.ai30001-x86_64.AppImage \
	-o packages/bathroom/sink/drain.stl \
	packages/bathroom/sink/drain.scad
```

### Export PNG

```sh
APPIMAGE_EXTRACT_AND_RUN=1 \
	bin/OpenSCAD-2025.12.17.ai30001-x86_64.AppImage \
	--render \
	--imgsize=1200,900 \
	-o packages/bathroom/sink/drain.png \
	packages/bathroom/sink/drain.scad
```

## Internal Helpers (advanced)

The following names exist in `drain.scad` but are underscore-prefixed and should be treated as internal (not a stable API): `_pick()`, `_cross2d()`, `_annulus2d()`, `_annular_slot_mask_2d()`, `_filter_plate()`.
