thickness = 4;

// Back
backWidth = 20;
backDepth = thickness;
backHeight = 60;

// Bottom
bottomWidth = 20;
bottomDepth = 20;
bottomHeight = thickness;

// Front
frontWidth = 20;
frontDepth = thickness;
frontHeight = 20;

module hook() {
    cube([backWidth, backDepth, backHeight]);
    translate([0, -(bottomDepth), 0]) {
        cube([bottomWidth, bottomDepth, bottomHeight]);
        cube([frontWidth, frontDepth, frontHeight]);
    }
}

rotate([180, 270, 0])
hook();