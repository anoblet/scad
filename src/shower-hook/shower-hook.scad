rotate_extrude(angle = 270, convexity = 10, $fn = 100) {
    translate([10, 0, 0]) {
        circle(r = 1, $fn = 100);
    }
}

rotate([0, 0, 180]) {
translate([0, 20, 0]) {
    rotate_extrude(angle = 270, convexity = 10, $fn = 100) {
        translate([10, 0, 0]) {
            circle(r = 1, $fn = 100);
        }
    }
}
}