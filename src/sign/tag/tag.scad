include <../../common/common.scad>
use <../NotoSans-VariableFont_wdth,wght.ttf>

fontSize = 4;
rounding = 4;
x = 48;
y = 32;
z = 2;

module background() {
    difference() {
        cuboid([x, y, z], except = [BOTTOM, TOP], rounding = rounding);
        translate([0, y / 3, 0]) {
            cylinder(d = 4, h = z, center = true);
        }
    }
}

module foreground() {
    translate([0, fontSize / 2, -(z / 2)]) {
        linear_extrude(z) text("EDITH", size = 4, font = "Noto Sans:style=Bold", halign = "center", valign = "center");
    }

    translate([0, -fontSize * 2, -(z / 2)]) {
        linear_extrude(z) text("(917) 575-4492", size = 4, font = "Noto Sans:style=Bold", halign = "center", valign = "center");
    }
}

// background();
foreground();
