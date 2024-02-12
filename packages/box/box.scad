/*
    @see https://www.omnicalculator.com/math/golden-ratio
*/

// Constants
goldenRatio = 1.618;

// Parameters
divisions = 4; // Binary
height = 64; // Binary
thickness = 4; // Binary
width = 192; // Binary

// depth = width * goldenRatio;
depth = 96;

rotate([0, 0, 45]) {
    difference() { 
        cube([width, depth, height], center = true);
        translate([0, 0, thickness]){
            cube([width - thickness, depth - thickness, height], center = true);
        }
    }
}