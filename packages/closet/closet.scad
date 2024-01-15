$fn = 128;

bottomDiameter = 10;
bottomHeight = 25;

lipDiameter = 14;
lipHeight = 2;

topDiameter = 8;
// topDiameter = 10;
topHeight = 25;
// topHeight = 18;

cylinder(d = bottomDiameter, h = bottomHeight, center = true);

translate([0, 0, (bottomHeight / 2) + (lipHeight / 2)]) {
    cylinder(d = lipDiameter, h = lipHeight, center = true);
}

translate([0, 0, (bottomHeight / 2) + lipHeight + (topHeight / 2)]) {
    cylinder(d = topDiameter, h = topHeight, center = true);
}