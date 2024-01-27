include <BOSL2/std.scad>

$fn = 128;

width = 150;
length = 100;
thickness = 5;

holeDiameter = thickness / 2;

module hole() {
    rotate([0, 90, 0]) {
        cylinder(h = thickness * 2, r = holeDiameter / 2, center = true);
    }
}

module triangle() {
    right_triangle([width, length]);
}

difference() {
    linear_extrude(height = thickness) {
        difference() {
            triangle();
            offset(delta = -(thickness / 2)) {
                triangle();
            }
        }
    }

    translate([0, (length * 1/2), (thickness / 2)]) {
        hole();
    }

    translate([0, (length * 1/4), (thickness / 2)]) {
        hole();
    }
}

translate([width - (thickness * 2), 0, 0]) {
    cube([thickness * 2, thickness / 2, thickness]);
}

translate([width, 0, 0]) {
    cube([thickness / 2, thickness * 2, thickness]);
}

translate([width - thickness / 2, thickness * 2, 0]) {
    cube([thickness, thickness / 2, thickness]);
}