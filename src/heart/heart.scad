// Import BOSL2 library for advanced geometry utilities and modules
include <BOSL2/std.scad>;

// Module to generate a 2D heart shape using geometric primitives
module heart_shape(size = 10) {
    // Vertically scale the shape to achieve a more natural heart aspect ratio
    scale([1, 1.25, 1]) {
        // Rotate the combined circles to orient the heart upright
        rotate([0, 0, 45]) {
            union() {
                // First circle forms the left lobe of the heart
                circle(d = size);
                // Second circle forms the right lobe, offset to overlap with the first
                translate([size / 2, size / 2, 0]) circle(d = size);
            }
        }
    }
}

// Render the heart shape at the specified size
heart_shape(size = 20);