include <common.scad>

tolerance = 1;

espX = 22.52;
espY = 18;
espZ = 8;

portX = wall;
portY = 9;
portZ = 4;

difference() {
    union() {
        difference() {
            cuboid([enclosureX, enclosureY, enclosureZ], except = [BOTTOM, TOP], rounding = rounding);
            translate([0, 0, wall]) {
                cuboid([enclosureX - (wall * 2), enclosureY - (wall * 2), enclosureZ + wall]);
            }
        }

        translate([-(enclosureX - espX - tolerance - (wall * 2)) / 2, 0, -(enclosureZ - espZ) / 2 + wall]) {
            difference() {
                difference() {
                    cuboid([espX + tolerance + (wall * 2), espY + tolerance + (wall * 2), espZ]);
                    translate([0, 0, wall]) {
                        cuboid([espX + tolerance, espY + tolerance, espZ + wall]);
                    }
                }
            }
        }
    }

    translate([-(enclosureX - espX - tolerance - (wall * 2)) / 2, 0, -(enclosureZ - espZ) / 2 + wall]) {
        translate([-(((espX + portX - tolerance) / 2) + wall), 0, -(((espZ - portZ) / 2) - (wall / 2))]) {
            cuboid([portX, portY, portZ]);
        }
    }
}