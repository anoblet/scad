include <BOSL2/std.scad>
include <BOSL2/threading.scad>
include <./constants.scad>
include <./modules.scad>

screwHeight = blockHeight;
tolerance = layerHeight * 2;

translate([blockLength / 4, (blockLength / 2) + ((tongueLength - tolerance) / 2), 0]) {
    tongue();
}

translate([-((blockLength / 2) + ((tongueLength - tolerance) / 2)), blockLength / 4, 0]) {
    tongue();
}

translate([0, 0, (blockHeight / 2) + (screwHeight / 2)]) {
    cylinder(d = screwDiameter - tolerance, h = screwHeight, center = true);
}

difference() {
    cube([blockLength, blockLength, blockHeight], center = true);

    union() {
        translate([-((blockLength / 2) - (tongueLength / 2)), -(blockLength / 4), 0]) {
            groove();
        }

        translate([-(blockLength / 4), (blockLength / 2) - (tongueLength / 2), 0]) {
            groove();
        }

        if(ring) {
            translate([-(blockLength / 2), blockLength / 2, (blockHeight / 2) - (ringHeight / 2)]) {
                ring();
            }
        }

        translate([0, 0, -((blockHeight / 2) - (screwHeight / 2))]) {
            // cylinder(d = pipeDiameter, h = screwHeight, center = true);
        }
    }
}