include <../common/common.scad>

$fa = $preview ? 12 : 0.08;
$fs = $preview ? 2 : 0.08;

nozzleDiameter = 0.4;

outerHeight = 10;
innerHeight = 2;
border = 2;
radius = 50;
raisedHeight = nozzleDiameter / 2;
tolerance = nozzleDiameter;

cylinder(h = border, r = radius - border - tolerance);
translate([0, 0, border]) {
    difference() {
        cylinder(h = outerHeight, r = radius);
        cylinder(h = outerHeight, r = radius - border);
    };

    cylinder(h = innerHeight, r = radius - border);

    union() {
        translate([-radius, 0, border]) {
            cube([(radius * 2) - border, border, raisedHeight]);
        };

        translate([0, -radius, border]) {
            cube([border, (radius * 2) - border, raisedHeight]);
        };
    }
}