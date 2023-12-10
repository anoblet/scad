include <BOSL2/std.scad>

rotate([0,270,0]) {
    linear_extrude(height = 25) {
        right_triangle([40,150]);
    }
}