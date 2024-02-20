include <BOSL2/std.scad>

$fn = $preview ? 32 : 128;

/*
    @see https://www.omnicalculator.com/math/golden-ratio
*/

// Constants
goldenRatio = 1.618;

// Parameters
divisions = 4; // Binary
height = 48; // Binary
thickness = 4; // Binary
width = 128; // Binary

// depth = width * goldenRatio;
depth = 64;

radius = 4;

rotate([0, 0, 45]) {
    difference() {
        linear_extrude(height) {
            offset(r=radius) {
                projection() {
                    cube([width, depth, height], center = true);
                }
            }
        }

        translate([0, 0, thickness]){
            cube([width, depth, height], center = true);
        }
    }

    translate([0,0, height / 2 + thickness]) {
        cube([thickness, depth, height / 4], center = true);
    }
}