include <./constants.scad>

pipeHeight = 64;

difference() {
    union() {
        cube([pipeLength, pipeLength, pipeHeight], center = true);
        translate([0, 0, (pipeHeight + pinLength - tolerance) / 2]) {
            cube([pinLength, pinLength - tolerance, pinLength - tolerance], center = true);
        }
    }
    translate([0, 0, -((pipeHeight - pinLength) / 2)]) {
        cube([pinLength, pinLength, pinLength], center = true);
    }
}