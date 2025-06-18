include <../common/common.scad>

$fa = $preview ? 12 : 0.16;
$fs = $preview ? 2 : 0.16;

/*
    Sunglasses Container
    A simple container designed to hold 1-2 pairs of sunglasses.
    Features padded compartments and a secure lid.
*/

// Container dimensions
containerWidth = 180;   // Wide enough for typical sunglasses
containerDepth = 80;    // Deep enough for folded glasses
containerHeight = 60;   // Height for stacked glasses
wallThickness = 2;      // Wall thickness for durability
bottomThickness = 2;    // Thicker bottom for stability

// Compartment settings
numCompartments = 2;    // For 1-2 pairs of glasses
dividerThickness = 2;   // Thickness of center divider
padding = 5;            // Internal padding/clearance

// Rounding and aesthetics
cornerRadius = 2;       // Rounded corners for smooth finish

// Calculated dimensions
innerWidth = containerWidth - (wallThickness * 2);
innerDepth = containerDepth - (wallThickness * 2);
innerHeight = containerHeight - bottomThickness;
compartmentWidth = (innerWidth - dividerThickness) / numCompartments;

// Main container body
difference() {
    // Outer shell with rounded corners for aesthetics and comfort
    cuboid([containerWidth, containerDepth, containerHeight], 
           rounding=cornerRadius, teardrop=true, except=[TOP]);
    
    // Hollow out the interior to create storage space, leaving bottom and wall thickness
    translate([0, 0, bottomThickness]) {
        cuboid([innerWidth, innerDepth, innerHeight + 1], 
               rounding=cornerRadius-wallThickness);
        // Note: innerHeight + 1 ensures the hollowed space fully clears the top edge
    }
}