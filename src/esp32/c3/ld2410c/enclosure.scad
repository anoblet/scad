include <common.scad>

tolerance = 1;

espX = 22.52;
espY = 18;
espZ = 8;

portX = wallWidth;
portY = 9;
portZ = 4;

difference() {
    difference() {
        union() {
            difference() {
                cuboid([enclosureX, enclosureY, enclosureZ], except = [BOTTOM, TOP], rounding = rounding);
                translate([0, 0, wallWidth]) {
                    cuboid([enclosureX - (wallWidth * 2), enclosureY - (wallWidth * 2), enclosureZ + wallWidth]);
                }
            }

            translate([-(enclosureX - espX - tolerance - (wallWidth * 2)) / 2, 0, -(enclosureZ - espZ) / 2 + wallWidth]) {
                difference() {
                    difference() {
                        cuboid([espX + tolerance + (wallWidth * 2), espY + tolerance + (wallWidth * 2), espZ]);
                        translate([0, 0, wallWidth]) {
                            cuboid([espX + tolerance, espY + tolerance, espZ + wallWidth]);
                        }
                    }
                }
            }
        }

        translate([-(enclosureX - espX - tolerance - (wallWidth * 2)) / 2, 0, -(enclosureZ - espZ) / 2 + wallWidth]) {
            translate([-(((espX + portX - tolerance) / 2) + wallWidth), 0, -(((espZ - portZ) / 2) - (wallWidth / 2))]) {
                cuboid([portX, portY, portZ]);
            }
        }
    }

    translate([0, (enclosureY - wallWidth) / 2, 0]) {
        cuboid([wallWidth, wallWidth, (enclosureZ - (wallWidth * 2)) / 2]);
    }
}
