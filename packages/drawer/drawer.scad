width = 115;
// width = 10;
depth = 148;
// depth = 10;
height = 85;    

wallThickness = 2;

difference() { 
    cube([width, depth, height], center = true);
    cube([width - wallThickness, depth - wallThickness, height], center = true);
}