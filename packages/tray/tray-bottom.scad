$fn = $preview ? 32 : 128;

// Parameters
tolerance = 2;
diameter = 192;
thickness = 2;
bearingInnerDiameter = 8;
bearingOuterDiameter = 22;
bearingHeight = 7;
baseHeight = 7;

cylinder(d=diameter, h=baseHeight, center=true);
translate([0, 0, (bearingHeight + baseHeight) / 2]) {
    cylinder(d=bearingInnerDiameter, h=(bearingHeight), center=true);
}

