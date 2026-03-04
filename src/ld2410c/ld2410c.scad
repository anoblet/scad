include <BOSL2/std.scad>
include <common.scad>

difference() {
    difference() {
        cuboid([espWidth + wall, espDepth + wall, espHeight], except = [BOTTOM, TOP], rounding = rounding);
        translate([0, 0, wall]) {
            cuboid([espWidth, espDepth, espHeight + wall]);
        }
    }

    translate([((espWidth - plugWidth) / 2) + wall, 0, -(espHeight - plugHeight - wall) / 2]) {
        cuboid([plugWidth, plugDepth, plugHeight]);
    }
}

difference() {
    translate([-(espWidth - sensorDepth) / 2, 0, -(espHeight - sensorHeight - wall) / 2]) {
        rotate([0, 0, 90]) {
            difference() {
                cuboid([sensorWidth + wall, sensorDepth + wall, sensorHeight + wall], except = [BOTTOM, TOP], rounding = rounding);
                translate([0, 0, wall]) {
                    cuboid([sensorWidth, sensorDepth, sensorHeight]);
                }
            }
        }
    }
}
