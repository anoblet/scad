include <./constants.scad>

poleHeight = 64;

difference() {
    union() {
        cube([poleLength, poleLength, poleHeight], center = true);
        translate([0, 0, (poleHeight + pinLength - (tolerance / 2)) / 2]) {
            cube([pinLength, pinLength, pinLength - (tolerance / 2)], center = true);
        }
    }
    translate([0, 0, -((poleHeight - pinLength) / 2)]) {
        cube([pinLength, pinLength, pinLength], center = true);
    }
}