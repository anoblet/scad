include <BOSL2/std.scad>;
include <../common/common.scad>;

difference() {
    cylinder(d = 50, h = 10, center = true);

    translate([0, 0, 2]) {
        cylinder(d = 48, h = 8, center = true);
    }
}

