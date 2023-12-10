include <BOSL/constants.scad>
use <BOSL/shapes.scad>

$fn = 100;

border = 10;
height = 150;
thickness = 10;
width = 150;

hookHeight = 10;
hookLength = 10;

screwRadius = 2;

difference() {
    right_triangle([width, thickness, height]);
    translate([border / 2, 0, border / 2 ]) {
        color("red") {
            right_triangle([width - (border * 1.75), thickness, height - ( border * 1.75 )]);
        }
    }
    
    translate([0, thickness / 2, height / 4]) {
        rotate([90, 0, 90]) {
            cylinder(h = border, r= screwRadius);
        }
        
    }
    
        translate([0, thickness / 2, (height / 4) * 3]) {
        rotate([90, 0, 90]) {
            cylinder(h = border, r= screwRadius);
        }
        
    }
}

translate([width - border, 0, 0]) {
    cube([hookLength, thickness, border / 2]);
    
    translate([hookLength - (border / 4), (thickness / 4), 0]) {
        cube([border / 4, thickness / 2, hookHeight]);
    }
}
