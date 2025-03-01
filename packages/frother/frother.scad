include <../common/common.scad>

$fa = $preview ? 12 : 0.32;
$fs = $preview ? 2 : 0.32;

diameter = 60;
length = 4;
thickness = 2;

difference() {
    cyl(l = length, d = 60);
    translate([0, 0, thickness]) {
        cyl(l = length, d = diameter - thickness);
    }
}
