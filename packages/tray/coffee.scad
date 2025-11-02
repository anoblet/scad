include <../common/common.scad>

// Set the wall thickness and overall outer dimensions
thickness = 2;
outerWidth = 192;
outerDepth = 192;
outerHeight = 10;

// Calculate the inner dimensions based on the wall thickness
innerWidth = outerWidth - (thickness * 2);
innerDepth = outerDepth - (thickness * 2);
innerHeight = outerHeight - thickness;

// Set the rounding radius for outer and inner cuboids
outerRounding = outerWidth / 64;
innerRounding = innerWidth / 64;

difference() {
    cuboid([outerWidth, outerDepth, outerHeight], except=[BOTTOM,TOP], rounding = outerRounding);
    translate([0,0,thickness])
    cuboid([innerWidth, innerDepth, innerHeight], except=[BOTTOM,TOP], rounding = innerRounding);
}