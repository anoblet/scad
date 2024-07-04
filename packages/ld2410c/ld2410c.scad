include <BOSL2/std.scad>

$fa = $preview ? 12 : 0.01;
$fs = $preview ? 2 : 0.01;

width = 24;
depth = 4;
height = 12;

wall = 2;

espWidth = 64;
espDepth = 64;
espHeight = 36;

rounding = wall / 2;

difference() {
    cuboid([width + wall, depth + wall, height + wall]);
    translate([0, 0, wall]) {
        cuboid([width, depth, height]);
    }
}

translate([0, (espDepth - depth) / 2, -((height - espHeight + wall) / 2)]) {
    difference() {
        cuboid([espWidth + wall, espDepth + wall, espHeight + wall], except = [BOTTOM, TOP], rounding = rounding);
        translate([0, 0, wall]) {
            cuboid([espWidth, espDepth, espHeight]);
        }
    }
}

