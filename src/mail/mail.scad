include <BOSL2/std.scad>

$fa = $preview ? 12 : 0.01;
$fs = $preview ? 2 : 0.01;

width = 64;
depth = 128;
height = 96;

rounding = 4;

wallWidth = 2;

/*
difference() {
    cuboid([width, depth, height], except=[BOTTOM,TOP], rounding = rounding);
    translate([0, 0, wallWidth]) {
        cuboid([width - (wallWidth * 2), depth - (wallWidth * 2), height - wallWidth], except=[BOTTOM,TOP], rounding = rounding);
    }
}
*/

difference() {
    cuboid([width, depth, height], except=[BOTTOM,TOP], rounding = rounding);

    translate([0, 0, (wallWidth / 2)]) {
        linear_extrude(height - wallWidth, center = true) {
            offset(delta = -wallWidth) {
                projection() cuboid([width, depth, height], except=[BOTTOM,TOP], rounding = rounding);
            }
        }
    }
}

translate([0, 0, wallWidth]) {
    xcopies(width / 3) cuboid([wallWidth, depth - (wallWidth * 2), height - (wallWidth * 2)]);
}