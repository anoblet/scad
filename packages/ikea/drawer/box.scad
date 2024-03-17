include <BOSL2/std.scad>

$fn = $preview ? 32 : 128;

// Parameters
width = 100;
depth = 10;
height = 2;
thickness = 2;
rounding = thickness / 2;

rotate([0, 0, 45]) {
    difference() {
        cuboid([width + (thickness * 2), depth + (thickness * 2), height + thickness], except=[BOTTOM,TOP], rounding = rounding);

        translate([0, 0, thickness]){
            cube([width, depth, height], center = true);
        }
    }
}

/* 
    Tolerance defined as OD or ON (Outside Diameter or Nominal)
*/  
tolerance = 0.2;


    // Division
    // translate([0,0, -((height / 2) - (height / 4) - (thickness / 2))]) {
    //     cube([thickness, depth, (height / 2) - thickness], center = true);
    // }
}