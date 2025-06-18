include <BOSL2/std.scad>;
include <../common/common.scad>;

// Set angular and segment resolution for preview and final render
$fa = $preview ? 12 : 0.02;
$fs = $preview ? 2 : 0.02;

// Core geometric parameters for the model
innerDiameter = 29;

bottomHeight = 8;
topHeight = 2;

outerDiameter = 54;

thickness = 2;
symbolLength = 4;

spacing = 4;

// Generate a grid of hexagonal holes inside a circle, staggered for even distribution
module circleGrid() {
    inside = circle($fn=6, d=innerDiameter - symbolLength);
    translate([0, 0, -(thickness / 2)]) {
        // grid_copies places repeated features in a grid pattern, staggered for hex tiling
        grid_copies(inside=inside, size = innerDiameter - spacing, spacing=spacing, stagger = true) {
            // Each grid cell contains a rotated hexagonal cylinder "hole"
            zrot(180/6) cylinder($fn = 6, d=symbolLength, h=thickness);
        }
    }
}

// Create a hexagonal grid pattern within a circular boundary
module hexagonGrid () {
    intersection() {
        // Limit the grid to a circular region
        cylinder($fn = 6, d = innerDiameter, h = topHeight, center = true);
        // Define the area for grid placement
        inside = circle(d=innerDiameter);
        translate([0, 0, -(thickness / 2)]) {
            // Place hexagonal cylinders in a staggered grid pattern
            grid_copies(spacing=4, stagger=true, inside=inside) {
                zrot(180/6) {
                    cylinder(h=thickness, d=symbolLength);
                }
            }
        }
    }
}

// Create a hollow cylinder with specified wall thickness
module emptyCylinder(diameter, thickness, height) {
    difference() {
        cylinder(d = diameter, h = height, center = true);
        cylinder(d = diameter - thickness, h = height, center = true);
    }
}

// Build the main base structure with a raised rim and hollowed center
module base() {
    // Top disk of the base
    cylinder(d = outerDiameter, h = topHeight, center = true);

    // Raised cylindrical rim, hollowed out in the center
    translate([0, 0, (bottomHeight + topHeight) / 2]) {
        difference() {
            cylinder(d = innerDiameter + thickness, h = bottomHeight, center = true);
            cylinder(d = innerDiameter, h = bottomHeight, center = true);
        }
    }
}

// Subtract the circular grid pattern from the base to create holes
difference() {
    base(); 
    circles();
}

// Add cross-shaped reinforcement or decorative features on the top surface
cuboid([thickness / 2, innerDiameter, topHeight]);
rotate([0, 0, 45]) {
    cuboid([thickness / 2, innerDiameter, topHeight]);
}
cuboid([innerDiameter, thickness / 2, topHeight]);
rotate([0, 0, 45]) {
    cuboid([innerDiameter, thickness / 2, topHeight]);
}

// Create concentric hollow cylinders for the circular grid pattern
module circles() {
    union() {
        // Each iteration creates a ring, decreasing in diameter
        for ( i = [0 : 4] ){
            emptyCylinder(innerDiameter - ((thickness * 3) * i), thickness * 2, topHeight);
        }
    }
}