$fn = $preview ? 32 : 128;

// Parameters
tolerance = 0.2;
diameter = 50;
thickness = 2;
bearingDiameter = 22;
bearingHeight = 7 - (tolerance * 2);

difference() {
    cylinder(d=diameter, h=bearingHeight + thickness, center=true);
    translate([0, 0, thickness / 2]) {
        cylinder(d=bearingDiameter, h=(bearingHeight), center=true);
    }
}

