include <../common/common.scad>

height = 4;
symbolHeight = 2;
keyringDiameter = 0.4;

difference() {
    cylinder(r = symbolHeight * 4, center = true, h = height);
    translate(([0, (symbolHeight * 4) - symbolHeight, 0])) {
        cylinder(d = symbolHeight, h = height, center = true);
    }
}

translate([0, 0, (height / 2) - symbolHeight]) {
    linear_extrude(height = symbolHeight) {
        %text("MAIL", halign = "center", valign = "center");
    }
}