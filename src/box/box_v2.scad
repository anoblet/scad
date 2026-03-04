include <BOSL2/std.scad>

$fn = $preview ? 32 : 128;

// Parameters
width = 32;
depth = 32;
height = 16;
wallThickness = 2;

rounding = wallThickness / 4;

module cube() {
    projection() {
        cuboid([width - wallThickness, depth - wallThickness, wallThickness], except=[BOTTOM,TOP], rounding = rounding);
    }
}


linear_extrude(wallThickness) {
    cube();
}

translate([0,0,wallThickness]) {
    linear_extrude(wallThickness) {
        cube();
    }

    linear_extrude(height) {
        difference() {
            offset(r=wallThickness) {
                cube();
            }
            cube();
        }
    }
}