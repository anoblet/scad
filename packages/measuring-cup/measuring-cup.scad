include <BOSL2/std.scad>
include <../common/common.scad>;

diameter = 50;
height = 50;
thickness = 2;

handleX = 100;
handleY = 25;

rounding = handleY / 2;


difference() {
    union() {
        cylinder(d=diameter + thickness, h=height + thickness, center=true);

        translate([handleX / 2, 0, (height) / 2]) {
            cuboid([handleX, handleY, thickness], except=[BOTTOM,TOP], rounding = rounding);
        }
    }

    translate([0, 0, thickness]) {
        cylinder(d=diameter, h=height, center=true);
    }
}
