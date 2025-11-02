include <../common/common.scad>

// Set the wall thickness and overall outer dimensions
thickness = 2;
outerWidth = 128;
outerDepth = 128;
outerHeight = 10;

// Calculate the inner dimensions based on the wall thickness
innerWidth = outerWidth - thickness;
innerDepth = outerDepth - thickness;
innerHeight = outerHeight - thickness;

// Set the rounding radius for outer and inner cuboids
outerRounding = outerWidth / 32;
innerRounding = innerWidth / 32;

difference() {
    cuboid([outerWidth, outerDepth, outerHeight], except=[BOTTOM,TOP], rounding = outerRounding);
    translate([0,0,thickness])
    cuboid([innerWidth, innerDepth, innerHeight], except=[BOTTOM,TOP], rounding = innerRounding);
}