$fn = $preview ? 32 : 128;

// Parameters
tolerance = 0.1;
diameter = 48;
thickness = 2;
baseHeight = 7;
bearingInnerDiameter = 8 + tolerance;
bearingOuterDiameter = 22;
bearingHeight = 7;

cylinder(d=diameter, h=baseHeight, center=true);
translate([0, 0, (bearingHeight + baseHeight) / 2]) {
    cylinder(d=bearingInnerDiameter, h=(bearingHeight), center=true);
}

