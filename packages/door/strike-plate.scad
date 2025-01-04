include <../common/common.scad>;

x = 29;
y =  66;
z = 2;

innerX = 22.5;
innerY = 30;

rounding = 2;
screwDiameter = 5;

difference() {
    difference() {
        cuboid([x, y, z], except=[BOTTOM,TOP], rounding = rounding);

        union() {
            translate([0, (y / 2) - screwDiameter * 2, 0]) {
                cylinder(d = 5, center = true, h = z);
            }   

            translate([0, -((y / 2) - screwDiameter * 2), 0]) {
                cylinder(d = 5, center = true, h = z);
            }
        }
    }

    cuboid([innerX, innerY, z], except=[BOTTOM,TOP], rounding = rounding);
}