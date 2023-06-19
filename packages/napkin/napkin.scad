scale = 1;

containerHeight = 25 * scale;
napkinSize = 155 * scale;
slotThickness = napkinSize / 4;
wallThickness = 5 * scale;

difference() {
    cube([napkinSize + wallThickness, napkinSize + wallThickness, containerHeight], center = true);
    translate([0, 0, wallThickness]) {
        cube([napkinSize, napkinSize, containerHeight + wallThickness], center = true);
        translate([0, wallThickness, 0]) {
            cube([slotThickness, napkinSize + wallThickness, containerHeight + wallThickness], center = true);
        }
    }
}