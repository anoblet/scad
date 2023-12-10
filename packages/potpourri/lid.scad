
include <constants.scad>;

module lid() {
    difference() {
        cube([width, depth, thickness]);
        translate([0, 0, thickness]) {
            cube([width - thickness, depth - thickness, thickness]);
        }
    }
}

lid();
