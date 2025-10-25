include <../common/common.scad>

$fa = $preview ? 12 : 0.16;
$fs = $preview ? 2 : 0.16;

thickness = 2;
outerDiameter = 128;
innerDiameter = outerDiameter - thickness;
length = 12;
innerRounding = innerDiameter / 12;
outerRounding = outerDiameter / 12;
text = "MILK";
textHeight = thickness / 2;
textSize = 12;
tolerance = 0.2;

module base() {
    // Cap
    cyl(l = length, d = outerDiameter, rounding1 = outerRounding, teardrop = true);
    translate([0, 0, (length + thickness) / 2]) {
        difference() {
            // Outer ring
            cyl(l = thickness, d = innerDiameter - thickness - tolerance);
            // Inner ring
            cyl(l = thickness, d = innerDiameter - thickness - tolerance - thickness);
        }
    }
}

module text() {
    translate([0, 0, -((length - textHeight) / 2)]) {
        rotate([0, 180, 0]) {
            text3d(text, center = true, font="Noto Sans", h = textHeight, size = textSize);
        }
    }
}

color("black") {
    base();
}

color("white") {
    text();
}