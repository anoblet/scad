include <BOSL2/std.scad>
include <BOSL2/threading.scad>

$fn = 128;

scale = 1;

centerDiameter = 100 * scale;
centerHeight = 2.5 * scale;

screwDiameter = 15;
screwHeight = 10 * scale;

pitch = screwHeight / 5;
slop = 0.25;

// Top
threaded_rod(d = screwDiameter, height = screwHeight, pitch = pitch);

// Center
translate([0, 0, -(screwHeight / 2 + centerHeight / 2)]) {
    cylinder(center = true, d = centerDiameter, h = centerHeight);
}

