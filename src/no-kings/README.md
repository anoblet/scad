No Kings

Purpose

- Produce a simple, highly legible mark that communicates "no kings" (a crown with a prohibitory cross). The outputs are intended for 2D graphics (SVG) and 3D printing (OpenSCAD).

References

- Source/reference assets: ./reference/

Deliverables

- src/no-kings/no-kings.svg — 2D vector, final artwork.
- src/no-kings/no-kings.scad — OpenSCAD file that reproduces the geometry for 3D printing.

Design requirements

- Simple, single-symbol composition: a crown centered inside a circle with a diagonal cross overlay that clearly intersects the crown.
- Colors (use exact hex values in the SVG):
	- Circle stroke: black #000000
	- Background/fill: white #FFFFFF
	- Crown: yellow/gold #FFD700
	- Cross: red #FF0000
- SVG: deliver as a 2000×2000 (px) viewBox or scalable equivalent. Use stroke widths that scale (e.g. circle stroke 24px at 2000px canvas). Keep paths simple (few nodes) and use groups with descriptive IDs (crown, cross, outline).
- SCAD: construct from primitives or import the optimized SVG paths. Provide a parameterized file with at least these variables at the top: diameter = 50; thickness = 3; outline_thickness = 2; cross_depth = 4; crown_depth = 3. Use linear_extrude() for layers and boolean ops (union/difference) to combine parts.

3D printing guidance

- Keep thin features >= 1 mm. Use fillets or chamfers on thin tips to avoid fragile spikes.
- Prefer positive relief (crown and cross raised above background) or recessed engraving depending on application. Default: raised crown and cross on a circular base, total thickness = thickness.
- Export STL from OpenSCAD after verifying wall thickness and manifold geometry.

Recommended workflow

1. Use the reference assets in ./reference/ to sketch a minimal crown and cross in vector editor (Inkscape, Illustrator).
2. Save optimized SVG to src/no-kings/no-kings.svg with the specified colors and IDs.
3. Implement or import the same paths into src/no-kings/no-kings.scad. Add top-level parameters so sizes can be adjusted easily.
4. Test-print a small prototype (diameter 50 mm) and adjust thicknesses.

License / attribution

- Keep assets compatible with project license and include attribution only if required by any reference sources.
