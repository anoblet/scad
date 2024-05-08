include <BOSL2/std.scad>

$fn = $preview ? 32 : 128;

totalWidth = 270;
columns = 5;

// Parameters
width = (totalWidth / columns) * 2;
depth = (totalWidth / columns) * 4;
height = 20;
thickness = 2;
rounding = thickness / 2;

difference() {
    cuboid([width, depth, height], except=[BOTTOM,TOP], rounding = rounding);

    translate([0, 0, thickness]){
        cube([width - (thickness * 2), depth - (thickness * 2), height], center = true);
    }
}
