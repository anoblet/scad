
include <constants.scad>;

module lid() {
    difference() {
        union() {
            cube([width, depth, thickness], center = true);
            translate([0, 0, thickness]) {
                difference() {
                    cube([width - thickness, depth - thickness, thickness], center = true);
                }
            }
        }

        cube([thickness, depth - (thickness * 2), height], center = true);

        translate([-((width / 4) + (width / 8)  - thickness / 2), 0, 0 ]) {
            cube([thickness, (depth * 2/3) - (thickness / 2) , height], center = true);
        }

        translate([(width / 4) + (width / 8) - thickness / 2, 0, 0 ]) {
            cube([thickness, (depth * 2/3) - (thickness / 2) , height], center = true);
        }

        translate([-((width / 4) - thickness / 2), 0, 0 ]) {
            cube([thickness, depth - (thickness * 2) , height], center = true);
        }

        translate([(width / 4) - thickness / 2, 0, 0 ]) {
            cube([thickness, depth - (thickness * 2) , height], center = true);
        }

        translate([-((width / 8) - thickness / 2), 0, 0 ]) {
            cube([thickness, (depth * 2/3) - (thickness / 2) , height], center = true);
        }

        translate([(width / 8) - thickness / 2, 0, 0 ]) {
            cube([thickness, (depth * 2/3) - (thickness / 2) , height], center = true);
        }
    }
}

lid();
