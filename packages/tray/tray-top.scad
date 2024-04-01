$fn = $preview ? 32 : 128;

// Parameters
tolerance = 0.2;
// diameter = 192;
diameter = 64;
thickness = 2;
bearingInnerDiameter = 8;
bearingOuterDiameter = 22 + tolerance;
bearingHeight = 7 + tolerance;
lipHeight = bearingHeight;

difference() {
    difference() {
        cylinder(d=diameter, h=lipHeight + bearingHeight + thickness, center=true);
        translate([0, 0, -((lipHeight + thickness) / 2)]) {
            cylinder(d=bearingOuterDiameter, h=bearingHeight, center=true);
        }
    }
    translate([0, 0, (bearingHeight + thickness) / 2]) {
        cylinder(d=diameter - thickness, h=lipHeight, center=true);
    }
}

