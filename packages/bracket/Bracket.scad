include <BOSL2/std.scad>

width = 100;
length = 50;
thickness = 5;

module triangle() {
    right_triangle([width, length]);
}

difference() {
    linear_extrude(height = thickness) {
        difference() {
            triangle();
            offset(delta = -(thickness)) {
                triangle();
            }
        }
    }

    translate([0, (length * 3/4) - (thickness), 0]) {
        cube([thickness, thickness, thickness]);
    }

    translate([0, (length * 1/4), 0]) {
        cube([thickness, thickness, thickness]);
    }
}

translate([width - (thickness * 2), 0, 0]) {
    cube([thickness * 2, thickness, thickness]);
}

translate([width, 0, 0]) {
    cube([thickness, thickness * 2, thickness]);
}