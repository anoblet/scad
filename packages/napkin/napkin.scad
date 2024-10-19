include <BOSL2/std.scad>
include <../common/common.scad>;

containerHeight = 25;
napkinSize = 155;
rounding = 2;
slotThickness = napkinSize / 4;
wallThickness = 5;

difference() {
    cuboid([napkinSize + wallThickness, napkinSize + wallThickness, containerHeight], except=[BOTTOM,TOP], rounding = rounding);
    translate([0, 0, wallThickness]) {
        cube([napkinSize, napkinSize, containerHeight + wallThickness], center = true);
        translate([0, wallThickness, 0]) {
            %cuboid([slotThickness, napkinSize + wallThickness, containerHeight + wallThickness], except=[BOTTOM,TOP], rounding = rounding);
        }
    }
}