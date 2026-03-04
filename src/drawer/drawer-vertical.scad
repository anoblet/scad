wallThickness = 4;

width = 76;
depth = 242;
height = 40;

rotate([0, 0, 45]) {
    difference() { 
        cube([width, depth, height], center = true);
        translate([0, 0, wallThickness]){
            cube([width - wallThickness, depth - wallThickness, height], center = true);
        }
    }
}