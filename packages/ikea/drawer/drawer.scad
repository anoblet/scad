include <BOSL2/std.scad>

$fn = $preview ? 32 : 128;

// Parameters
totalWidth = 296;
columns = 3;
width = (totalWidth / columns);
depth = totalWidth / columns;
height = 48;
thickness = 2;
rounding = thickness / 2;

rotate([0, 0, 45]) {
    difference() {
        cuboid([width, depth, height], except=[BOTTOM,TOP], rounding = rounding);

        translate([0, 0, thickness]){
            cube([width - (thickness * 2), depth - (thickness * 2), height], center = true);
        }
    }
}
