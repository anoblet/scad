$fn = 128;

nozzleDiameter = 0.4;

outerHeight = nozzleDiameter * 25;
innerHeight = nozzleDiameter * 5;
border = nozzleDiameter * 5;
radius = nozzleDiameter * 125;
raisedHeight = nozzleDiameter;
tolerance = nozzleDiameter;

cylinder(h = border, r = radius - border - tolerance);
translate([0, 0, border]) {
    difference() {
        cylinder(h = outerHeight, r = radius);
        cylinder(h = outerHeight, r = radius - border);
    };

    cylinder(h = innerHeight, r = radius - border);

    translate([-radius, 0, border]) {
        cube([(radius * 2) - border, border, raisedHeight]);
    };

    translate([0, -radius, border]) {
        cube([border, (radius * 2) - border, raisedHeight]);
    };
}