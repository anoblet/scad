$fn = 60;

// Diameter of the inner tube (Measured from the outside)
innerDiameter = 12.5;

// Diameter of the outer tube (Measured from the inside)
outerDiameter = 15;

// Thickness of the tube (Determines the lip size)
tubeThickness = 1;

// The length of the adapter
height = 25;

// The length of the lip
lipHeight = 1;

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