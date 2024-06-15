include <BOSL2/std.scad>

length = 192;
height = 4;
wall = 8;

density = wall * 2;

poleHeight = 192;
poleLength = wall * 2;

difference() {
    union() {
        rotate([0, 0, 45]) {
            difference() {
                cube([length * 2, length * 2, height], center=true);
                grid_copies(size=length * 2, spacing=density + (wall / 2)) {
                    cube([density, density, 10], center=true);
                }
            }
        }

        difference() {
            cube([length, length, height], center=true);
            cube([length - wall, length - wall, height], center=true);
        }
    }

    union() {
        translate([length, 0, 0]) {
            cube([length, length * 2, height], center=true);
        }
        translate([-length, 0, 0]) {
            cube([length, length * 2, height], center=true);
        }
        translate([0, length, 0]) {
            cube([length, length, height], center=true);
        }
        translate([0, -length, 0]) {
            cube([length, length, height], center=true);
        }
    }
}

translate([(length / 2) - (poleLength / 2), (length / 2) - (poleLength / 2), -(height / 2) + (poleHeight / 2)]) {
    cube([poleLength, poleLength, poleHeight], center=true);
}

translate([-((length / 2) - (poleLength / 2)), (length / 2) - (poleLength / 2), -(height / 2) + (poleHeight / 2)]) {
    cube([poleLength, poleLength, poleHeight], center=true);
}

translate([(length / 2) - (poleLength / 2), -((length / 2) - (poleLength / 2)), -(height / 2) + (poleHeight / 2)]) {
    cube([poleLength, poleLength, poleHeight], center=true);
}

translate([-((length / 2) - (poleLength / 2)), -((length / 2) - (poleLength / 2)), -(height / 2) + (poleHeight / 2)]) {
    cube([poleLength, poleLength, poleHeight], center=true);
}