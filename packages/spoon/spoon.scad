include <../common/common.scad>

$fa = $preview ? 12 : 0.32;
$fs = $preview ? 2 : 0.32;

// Set the wall thickness and overall outer dimensions
thickness = 2;
outerWidth = 50;
outerHeight = 75;
length = 16;

// Calculate the inner dimensions based on the wall thickness
innerWidth = outerWidth - thickness;
innerHeight = outerHeight - thickness;

// Set the rounding radius for outer and inner cuboids
outerRounding = outerWidth / 4;
innerRounding = innerWidth / 4;

difference() {
    // Create a hollowed, rounded cuboid shell by subtracting a smaller cuboid from a larger one
    difference() {
        // Outer shell with rounded vertical edges, flat top and bottom
        cuboid([outerWidth, outerHeight, length], rounding = outerRounding, except = [BOTTOM, TOP]);
        translate([0, 0, thickness]) {
            // Inner cutout, inset by wall thickness, to create the hollow
            cuboid([innerWidth, innerHeight, length], rounding = innerRounding, except = [BOTTOM, TOP]);
        }
    }
    // Subtract a slot from the shell, positioned off-center vertically
    translate([0, (outerHeight / 4) + thickness, (length / 2)]) {
        // Slot is a small cuboid with minimal rounding, possibly for cable or feature access
        cuboid([outerWidth / 4, outerHeight / 2, length], rounding = innerRounding / 8);
    }
}