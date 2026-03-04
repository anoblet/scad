include <../../../common/common.scad>

wallWidth = 2;

enclosureX = 56;
enclosureY = 32;
enclosureZ = 32;

innerEnclosureX = enclosureX - (wallWidth * 2);
innerEnclosureY = enclosureY - (wallWidth * 2);
innerEnclosureZ = enclosureZ - wallWidth;

espX = 22.52;
espY = 18;
espZ = 8;

portX = wallWidth;
portY = 9;
portZ = 4;

tolerance = 0.2;

rounding = (enclosureX + enclosureY) / 64;
innerRounding = (innerEnclosureX + innerEnclosureY) / 64;

difference() {
    union() {
        difference() {
            // Create the outer enclosure
            cuboid([enclosureX, enclosureY, enclosureZ], except = [BOTTOM, TOP], rounding = rounding);

            // Create the inner cavity
            translate([0, 0, wallWidth]) {
                cuboid([innerEnclosureX, innerEnclosureY, innerEnclosureZ], except = [BOTTOM, TOP], rounding = innerRounding);
            }
        }

        translate([-(enclosureX - espX - tolerance - (wallWidth * 2)) / 2, 0, -(enclosureZ - espZ) / 2 + wallWidth]) {
            // Create the ESP32 cavity
            difference() {
                cuboid([espX + tolerance + (wallWidth * 2), espY + tolerance + (wallWidth * 2), espZ]);
                translate([0, 0, wallWidth]) {
                    cuboid([espX + tolerance, espY + tolerance, espZ + wallWidth]);
                }
            }
        }
    }

    translate([-(enclosureX - espX - (wallWidth)) / 2, 0, -(enclosureZ - espZ) / 2 + wallWidth]) {
        // Create the port cavity
        translate([-(((espX + portX - tolerance) / 2) + wallWidth), 0, -(((espZ - portZ) / 2) - (wallWidth / 2))]) {
            cuboid([portX, portY, portZ]);
        }
    }
}