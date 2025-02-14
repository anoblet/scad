include <../common/common.scad>

$fa = $preview ? 12 : 0.16;
$fs = $preview ? 2 : 0.16;

thickness = 2;
outerDiameter = 96;
innerDiameter = outerDiameter - thickness;
length = 12;
innerRounding = innerDiameter / 8;
outerRounding = outerDiameter / 8;
textHeight = thickness / 2;
tolerance = 0.2;

difference() {
    color("black") {
        union() {
            cyl(l = length, d = outerDiameter, rounding1 = outerRounding, teardrop = true);
            translate([0, 0, (length + thickness) / 2]) {
                difference() {
                    cyl(l = thickness, d = innerDiameter - thickness - tolerance);
                    cyl(l = thickness, d = innerDiameter - thickness - tolerance - thickness);
                }
            }
        }
    }


    translate([0, 0, -((length - textHeight) / 2)]) {
        rotate([0, 180, 0]) {
            text3d("MILK", font="Noto Sans", h = textHeight, center = true);
        }
    }
}

translate([0, 0, -((length - textHeight) / 2)]) {
    rotate([0, 180, 0]) {
        color("white") {
            text3d("MILK", font="Noto Sans", h = textHeight, center = true);
        }
    }
}
