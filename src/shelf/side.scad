include <./constants.scad>
include <./modules.scad>

translate([blockLength / 4, (blockLength / 2) + ((tongueLength - tolerance) / 2), 0]) {
    tongue();
}

translate([-(blockLength / 4), -((blockLength / 2) + ((tongueLength - tolerance) / 2)), 0]) {
    tongue();
}

translate([-((blockLength / 2) + ((tongueLength - tolerance) / 2)), blockLength / 4, 0]) {
    tongue();
}

difference() {
    if(debug) {
        %cube([blockLength, blockLength, blockHeight], center = true);
    } else {
        cube([blockLength, blockLength, blockHeight], center = true);
    }

    union() {
        translate([-(blockLength / 4), (blockLength / 2) - (tongueLength / 2), 0]) {
            groove();
        }

        translate([blockLength / 4, -((blockLength / 2) - (tongueLength / 2)), 0]) {
            groove();
        }

        translate([-((blockLength / 2) - (tongueLength / 2)), -(blockLength / 4), 0]) {
            groove();
        }

        if(ring) {
            translate([-(blockLength / 2), blockLength / 2, (blockHeight / 2) - (ringHeight / 2)]) {
                ring();
            }
        }
    }
}
