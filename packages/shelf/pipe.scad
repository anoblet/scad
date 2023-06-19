include <BOSL2/std.scad>
include <BOSL2/threading.scad>
include <./constants.scad>
include <./modules.scad>

// Center
%cylinder(center = true, d = pipeDiameter, h = pipeHeight);

// Top
translate([0, 0, (pipeHeight / 2) + (screwHeight / 2)]) {
    threaded_rod(d = screwDiameter, height = screwHeight - slop, pitch = pitch);
}

// Bottom
translate([0, 0, -((pipeHeight / 2) + (screwHeight / 2))]) {
    intersection() {
        cylinder(center = true, d = pipeDiameter, h = screwHeight + slop);
        threaded_nut(nutwidth = pipeDiameter * 2, id = screwDiameter, h = screwHeight + slop, pitch = pitch, $slop = slop, shape = "square");
    }
}
