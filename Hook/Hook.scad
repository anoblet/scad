thickness = 4;

// Back
backWidth = 30;
backDepth = thickness;
backHeight = 60;

// Bottom
bottomWidth = 5;
bottomDepth = 20;
bottomHeight = 10;

// Front
frontWidth = 10;
frontDepth = thickness;
frontHeight = 20;

module hook() {
    cube([backWidth, backDepth, backHeight]);
    translate([(backWidth / 2) - (bottomWidth / 2), -(bottomDepth - backDepth), 0]) {
        cube([bottomWidth, bottomDepth - backDepth, bottomHeight]);
        translate([(bottomWidth / 2) - (frontWidth / 2), 0, 0]) {
            cube([frontWidth, frontDepth, frontHeight]);
        }
    }
}

hook();