include <../common/common.scad>

$fa = $preview ? 12 : 0.16;
$fs = $preview ? 2 : 0.16;

thickness = 2;
outerDiameter = 128;
innerDiameter = outerDiameter - thickness;
length = 72;
innerRounding = innerDiameter / 8;
outerRounding = outerDiameter / 8;

difference() {
    cyl(l = length, d = outerDiameter, rounding1 = outerRounding, teardrop = true);
    translate([0, 0, thickness]) {
        cyl(l = length + thickness, d = innerDiameter - thickness, rounding1 = innerRounding, teardrop = true);
    }
}