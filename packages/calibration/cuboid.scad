include <../common/common.scad>;

width = 10;
depth = 10;
height = 10;

 rounding = 0;

rotate([45, 45, 0]){
    cube([width, depth, height], center = true);
}