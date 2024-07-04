include <BOSL2/std.scad>

width = 48;
depth = 48;
height = 8;

lipDepth = 4;
lipHeight = 4;

wedge([ width, depth, height], center = true)
position(BACK + BOTTOM) orient("hypot") cuboid([width, lipDepth , lipHeight], anchor = BACK + BOTTOM);