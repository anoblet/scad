include <BOSL2/std.scad>

$fn = $preview ? 32 : 128;

// Parameters
width = 56;
depth = 24;
height = 72;
thickness = 2;
rounding = thickness / 2;

module box(width, depth, height, thickness, rounding) {
    difference() {
        cuboid([width + (thickness * 2), depth + (thickness * 2), height + thickness], except=[BOTTOM,TOP], rounding = rounding);

        translate([0, 0, thickness]){
            cube([width, depth, height], center = true);
        }
    }
}

box(width, depth, height, thickness, rounding);

// 2
translate([0, depth + thickness, -8]) {
    box(width, depth, height - 16, thickness, rounding);
}

// 3
// translate([0, depth + thickness, -8]) {
//     box(width, depth, height - 16, thickness, rounding);
// }

// translate([0, (depth * 2) + (thickness * 2), -16]) {
//     box(width, depth, height - 32, thickness, rounding);
// }
