include <common.scad>

cuboid([enclosureX, enclosureY, wallWidth], except = [BOTTOM, TOP], rounding = rounding);
translate([0, 0, wallWidth]) {
    cuboid([enclosureX - (wallWidth * 2), enclosureY - (wallWidth * 2), wallWidth]);
}

rotate([90, 180, 0]) {
    translate([0, -(sensorY / 2)- (wallWidth + wallWidth * 2 + wallWidth / 2), sensorY + (wallWidth * 2 + wallWidth)]) {
        difference() {
            difference() {
                cuboid([sensorX + (wallWidth * 4), sensorY + (wallWidth * 4), sensorZ + (wallWidth * 4)]);
                translate([0, 0, wallWidth]) {
                    cuboid([sensorX, sensorY, sensorZ]);
                }
            }

            translate([0, wallWidth, wallWidth]) {
                cuboid([sensorX + wallWidth * 4, sensorY + wallWidth * 2, sensorZ + wallWidth * 2]);
            }
        }
    }
}