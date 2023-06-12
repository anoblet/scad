include <BOSL2/std.scad>
include <BOSL2/threading.scad>

$fn = 128;

scale = 1;

centerDiameter = 30 * scale;
centerHeight = 10 * scale;

screwDiameter = centerDiameter / 2;
screwHeight = 10 * scale;

pitch = screwHeight / 5;
slop = 0.25;

// Top
//threaded_rod(d = screwDiameter, height = screwHeight, pitch = pitch);

// Center
translate([0, 0, (screwHeight / 2 + centerHeight / 2)]) {
    cylinder(center = true, d = centerDiameter, h = centerHeight);
}

// Bottom
translate([0, 0, ((screwHeight / 2) + centerHeight + (screwHeight / 2))]) {
    intersection() {
        cylinder(center = true, d = centerDiameter, h = screwHeight);
        threaded_nut(nutwidth = centerDiameter * 2, id = screwDiameter, h = screwHeight, pitch = pitch, $slop = slop, shape = "square");
    }
}
