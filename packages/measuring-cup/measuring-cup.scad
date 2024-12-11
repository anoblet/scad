include <../common/common.scad>;

$fa = 0.4;
$fs = 0.4;

diameter = 50;
height = 50;
thickness = 2;

handleX = 100;
handleY = 25;

rounding = handleY / 2;
translate([handleX / 2, 0, 0]) {
    cuboid([handleX, handleY, thickness], except=[BOTTOM,TOP], rounding = rounding);
}

difference() {
    difference() {

        union() {
                spheroid(d=50, style="icosa", circum=true, $fn=10);
                translate([handleX / 2, 0, 0]) {
                    cuboid([handleX, handleY, thickness], except=[BOTTOM,TOP], rounding = rounding);
                }
        }

        spheroid(d=50 - thickness, style="icosa", circum=true, $fn=10);
    }



  translate([0, 0, 50 + thickness / 2]) {
    cuboid(100);
  }
}