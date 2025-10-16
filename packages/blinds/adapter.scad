include <../modules/shaft.scad>

tolerance = 0.25;

$fn = 60;

adapterHeight = 25;
adapterRadius = 7.5;

// hookWidth = 3;
hookWidth = 2.8; // Originally 3
hookDepth = 8;
hookHeight = 12.5;

divider = 2;

module hook() {
    cube([hookWidth, hookDepth, hookHeight], center = true);
}

module adapter() {
    difference() {
        cylinder(h = adapterHeight, r = adapterRadius, center = true);
        
        translate([0, 0, -(adapterHeight / 2)]) {
            shaft();
        }

        translate([0, 0, (adapterHeight / 2) - (hookHeight / 2)]) {
            hook();
        }
    }
}

rotate([0, 180, 0]) {
    adapter();
}

