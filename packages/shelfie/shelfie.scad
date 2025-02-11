include <../common/common.scad>

totalWidth = 270;
columns = 5;

// Parameters
width = (totalWidth / columns) * 3;
depth = (totalWidth / columns) * 3;
height = 20;
thickness = 2;
rounding = thickness / 2;
// rounding = 0;

difference() {
    cuboid([width, depth, height], except=[BOTTOM,TOP], rounding = rounding);

    translate([0, 0, thickness]){
        cube([width - (thickness * 2), depth - (thickness * 2), height], center = true);
    }
}
