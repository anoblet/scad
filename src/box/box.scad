include <BOSL2/std.scad>

$fn = $preview ? 32 : 128;

/*
    @see https://www.omnicalculator.com/math/golden-ratio
*/

// Constants
goldenRatio = 1.618;

// Parameters
width = 64;
depth = 128;
height = 48;
thickness = 2;

rounding = thickness / 2;

divisions = 4;

rotate([0, 0, 45]) {
    difference() {
        cuboid([width + (thickness * 2), depth + (thickness * 2), height + thickness], except=[BOTTOM,TOP], rounding = rounding);

        translate([0, 0, thickness]){
            cube([width, depth, height], center = true);
        }
    }

    // Division
    // translate([0,0, -((height / 2) - (height / 4) - (thickness / 2))]) {
    //     cube([thickness, depth, (height / 2) - thickness], center = true);
    // }
}