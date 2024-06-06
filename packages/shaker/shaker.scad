include <BOSL2/std.scad>
include <BOSL2/threading.scad>

diameter = 16;
height = 32;

screwHeight = 4;
screwDiameter = 16;
pitch = 1;
slop = 0.1;

wallThickness = 2;

// Center
difference() {
    
    union() {
        // Top
        translate([0, 0, (height / 2) + (screwHeight / 2)]) {
            threaded_rod(d = screwDiameter, height = screwHeight, pitch = pitch);
        }
        cylinder(center = true, d = diameter, h = height);
    }

    translate([0, 0, screwHeight / 2])
    cylinder(center = true, d = diameter - wallThickness, h = height + screwHeight);
}

