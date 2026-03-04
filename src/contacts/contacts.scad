include <../common/common.scad>

$fa = $preview ? 12 : 0.16;
$fs = $preview ? 2 : 0.16;

lip = 2;
thickness = 2;
tolerance = 0.2;

outerX = 25;
outerY = 10;
outerZ = 25;

innerX = outerX - (thickness * 2);
innerY = outerY - (thickness * 2);
innerZ = outerZ - thickness;

outerRounding = (outerX + outerY) / 64;
innerRounding = (innerX + innerY) / 64;

topOuterX = innerX - tolerance;
topOuterY = innerY - tolerance;
topOuterZ = innerZ - tolerance + thickness;

topInnerX = topOuterX - (thickness * 2);
topInnerY = topOuterY - thickness;
topInnerZ = topOuterZ - thickness;

topOuterRounding = (topOuterX + topOuterY) / 64;
topInnerRounding = (topInnerX + topInnerY) / 64;

topOuterLipRounding = ((outerX + lip) + outerY) / 64;

module bottom() {
    difference() {
        cuboid([outerX, outerY, outerZ], except = [TOP], rounding = outerRounding, teardrop = true);
        translate([0, 0, thickness / 2]) {
            cuboid([innerX, innerY, innerZ], except = [BOTTOM, TOP], rounding = innerRounding);
        }
    }
}

module top() {
    translate([0, 0, -(topOuterZ - thickness) / 2]) {
        cuboid([outerX + (lip * 2), outerY, lip], except = [TOP], rounding = topOuterLipRounding);
    }

    difference() {
        cuboid([topOuterX, topOuterY, topOuterZ], except = [BOTTOM, TOP], rounding = topOuterRounding);
        translate([0, thickness / 2, 0]) {
            cuboid([topInnerX, topInnerY, topInnerZ - thickness], except = [BACK, BOTTOM], rounding = topInnerRounding);
        }
    }
}

bottom();

translate([50, 0, 0]) {
    rotate([180, 180, 0]) {
        top();
    }
}
