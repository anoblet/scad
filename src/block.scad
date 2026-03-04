// Import common utility functions and definitions shared across multiple OpenSCAD files
include <common/common.scad>

// Define the width of the cuboid in millimeters
width = 48;

// Define the height of the cuboid in millimeters
height = 64;

// Define the length (depth) of the cuboid in millimeters
length = 24;

// Create a cuboid with the specified dimensions; this is the main geometry for the model
cuboid([width, height, length]);