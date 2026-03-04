height = 6.5;
length = 50;
lip = 5;
thickness = 5;

baseHeight = 50;
baseLength = 50;

standWidth = length / 4;
standDepth = thickness;
standHeight = 50;

difference() {
    cube([length + thickness, length, height + thickness], center = true);

    union() {
        translate([0, 0, height / 2]) {
            cube([length - lip, length, thickness], center = true);
        }
        cube([length, length, height], center = true);
    }
}

/*
translate([0, -((length / 2) - (standDepth / 2)), -((height / 2) + (standHeight / 2) + (thickness / 2))]) {
  cube([standWidth, standDepth, standHeight], center = true);
}

translate([0, 0, -((height / 2) + standHeight + thickness)]) {
    cube([length, length, thickness], center = true);
}
*/

translate([0, 0, -(((height + thickness) /2) + 25)]) {
    color("red")
    // difference() {
        cube([baseLength + thickness, baseLength, baseLength + thickness], center = true);
    // }
}