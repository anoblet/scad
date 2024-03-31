$fn = $preview ? 32 : 128;

// Parameters
tolerance = 0.2;
diameter = 192;
thickness = 2;
bearingInnerDiameter = 8;
bearingOuterDiameter = 22;
bearingHeight = 7 - (tolerance * 2);

cylinder(d=diameter / 2, h=thickness, center=true);
translate([0, 0, (bearingHeight + thickness) / 2]) {
    cylinder(d=bearingInnerDiameter, h=(bearingHeight), center=true);
}

