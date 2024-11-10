include <common.scad>

cuboid([enclosureX, enclosureY, wall], except = [BOTTOM, TOP], rounding = rounding);
translate([0, 0, wall]) {
    cuboid([enclosureX - (wall * 2), enclosureY - (wall * 2), wall]);
}

rotate([90, 180, 0]) {
    translate([0, -(sensorY /2) - (wall) - 0.5, 0]) {
        difference() {
            cuboid([sensorX + (wall * 2), sensorY + (wall * 2), sensorZ + (wall * 2)], except = [BOTTOM, TOP], rounding = rounding);
            translate([0, 0, wall]) {
                cuboid([sensorX, sensorY, sensorZ]);
            }
        }
    }
}