goldenRatio = 1.618;

wallThickness = 4;

/*
    @see https://www.omnicalculator.com/math/golden-ratio
*/

width = 100;
depth = width * goldenRatio;
height = 40;

rotate([0, 0, 45]) {
    difference() { 
        cube([width, depth, height], center = true);
        translate([0, 0, wallThickness]){
            cube([width - wallThickness, depth - wallThickness, height], center = true);
        }
    }
}