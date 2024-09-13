include <BOSL2/std.scad>
include <../../common/common.scad>;

length = 75;
height = 50;
thickness = 5;

    difference() {
        rotate([0, 270, 0]) {
            translate([0, 0, -height / 2]) {
                linear_extrude(height = height) {
                    shell2d(-thickness) round2d(2) right_triangle([length, length], center = true, spin = 135);
                }
            }
        }

        translate([0, 0, (length / 2) + thickness]) {
            xcopies(15, n = 3) cuboid([10, length * 2, length]);
        }
    }
