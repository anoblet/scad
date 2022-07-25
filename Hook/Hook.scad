// Back
backWidth = 30;
backDepth = 5;
backHeight = 50;

// Bottom
bottomWidth = 10;
bottomDepth = 15;
bottomHeight = 5;

// Front
frontWidth = 10;
frontDepth = 5;
frontHeight = 20;

module hook() {
    cube([backWidth, backDepth, backHeight]);
    translate([(backWidth / 2) - (bottomWidth / 2),-(bottomDepth), 0]) {
        cube([bottomWidth, bottomDepth, bottomHeight]);
        translate([(bottomWidth / 2) - (frontWidth / 2), 0, 0]) {
            cube([frontWidth, frontDepth, frontHeight]);
        }
    }
}

hook();