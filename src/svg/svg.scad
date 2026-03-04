// Import common utilities or shared definitions from a relative path
include <../common/common.scad>

// Scale the entire model in X and Y by 0.75, leaving Z unchanged
scale([0.75, 0.75, 1]) {
    // Extrude the 2D SVG shape into a 3D object with 0.5 units height, centered on the Z axis
    linear_extrude(height = 0.5, center = true) {
        // Import a heart shape from SVG, centering it at the origin for consistent scaling and extrusion
        import("assets/heart.svg", center = true);
    }
}