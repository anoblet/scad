$fn = 128;

height = 10;
outerDiameter = 8;
innerDiameter = 5.5;

difference() {
    cylinder(h = height, d = outerDiameter, center = true);
    cylinder(h = height, d = innerDiameter, center = true);
}