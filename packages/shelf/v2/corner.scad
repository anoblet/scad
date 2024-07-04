include <./constants.scad>
include <./modules.scad>

blockLength = 64;
blockHeight = blockLength / 4;

columnLength = blockHeight;

tolerance = 0.2;

translate([blockLength / 4, (blockLength / 2) + ((tongueLength - tolerance) / 2), 0]) {
    tongue();
}

translate([-((blockLength / 2) + ((tongueLength - tolerance) / 2)), blockLength / 4, 0]) {
    tongue();
}

translate([((blockLength - columnLength) / 2), -((blockLength - columnLength) / 2), (blockHeight / 2) + ((pinLength - (tolerance * 2)) / 2)]) {
    cube([pinLength, pinLength, pinLength - (tolerance * 2)], center = true);
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

        translate([((blockLength - columnLength) / 2), -((blockLength - columnLength) / 2), -((blockHeight / 2) - (pinLength / 2))]) {
            cube([pinLength, pinLength, pinLength], center = true);
        }
    }
}
