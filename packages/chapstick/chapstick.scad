include <../common/common.scad>

height = 20;
radius = 7.125;
thickness = 1;

difference() {
    cylinder(h = height, r = radius + (thickness / 2), center = true);
    translate([0, 0, thickness]) {
        cylinder(h = height, r = radius, center = true);
    }
}
