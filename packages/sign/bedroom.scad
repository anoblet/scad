include <../common/common.scad>

height = 4;
symbolHeight = 2;

%cylinder(r = symbolHeight * 4, center = true, h = height);

translate([0, 0, (height / 2) - symbolHeight]) {
    linear_extrude(height = symbolHeight) {
        text("A", halign = "center", valign = "center");
    }
}