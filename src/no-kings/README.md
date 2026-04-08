# No Kings

## References

- [reference](reference)

## Description

- Parametric 64 mm badge or coin with a 2 mm overall thickness.
- The outer disk is 64 mm in diameter with a 3 mm black ring, leaving a 58 mm circular field in the center.
- The white field is formed by subtracting the crown and X shapes in 2D before extrusion. With `field_relief_depth = 0`, the face remains flat in the current 3D output.
- The crown comes from [crown-outline.svg](reference/crown-outline.svg), imported as a centered 2D silhouette, scaled uniformly by `crown_scale`, shifted by `crown_vertical_offset`, and clipped to the inner field. The default `crown_scale` is `6`.
- The red X is built from two centered rectangular bars, each with length `field_diameter * x_length_ratio`, width `x_bar_width`, and rotations of `+x_angle` and `-x_angle` degrees.
- The X bars are softened with `cross_rounding_radius` before clipping to the inner circular field, which preserves the current shape while slightly rounding the outside edges.
- Final preview colors are black ring, white field, gold crown, and red X.
- The design contains no text and is intended to print as a simple badge or coin.

## Parameters

- `coin_diameter = 64`
- `coin_thickness = 2`
- `ring_width = 3`
- `field_relief_depth = 0`
- `flat_preview = false`
- `crown_scale = 6`
- `crown_vertical_offset = 0`
- `x_bar_width = 3.0`
- `x_angle = 40`
- `x_length_ratio = 0.9`
- `cross_rounding_radius = 0.5`
