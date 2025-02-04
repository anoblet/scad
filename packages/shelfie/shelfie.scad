include <../common/common.scad>

totalWidth = 270;
columns = 3;

// Parameters
width = (totalWidth / columns) * 2;
depth = (totalWidth / columns) * 2;
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
