$fn = 60;

// Diameter of the inner tube (Measured from the outside)
innerDiameter = 12.5;

// Diameter of the outer tube (Measured from the inside)
outerDiameter = 15;

// Thickness of the tube (Determines the lip size)
tubeThickness = 1;

// The length of the adapter
height = 20;

// The length of the lip
lipHeight = 1;

// Version 2
// tubeThickness = 2;

// Version 3
// outerDiameter = 14;

// Version 4
// innerDiameter = 13.5;

lipHeight = 2;

// Version 5
// innerDiameter = 12.7;

// Version 6
innerDiameter = 12.75;

// Version 7
// innerDiameter = 13;

module adapter() {
    difference() {
        outerShell();
        cylinder(h = height, d = innerDiameter);
    }
}

module lip() {
    difference() {
        cylinder(h = height, d = outerDiameter + tubeThickness);
        cylinder(h = height - lipHeight, d = outerDiameter + tubeThickness);
    }
}

module outerShell() {
    cylinder(h = height, d = outerDiameter);
    lip();
}

rotate([0, 180, 0]) {
    adapter();
}