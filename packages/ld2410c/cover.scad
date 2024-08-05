include <BOSL2/std.scad>
include <common.scad>

cuboid([espWidth + wall, espDepth + wall, wall], except = [BOTTOM, TOP], rounding = wall / 2);
translate([0, 0, wall]) {
    cuboid([espWidth, espDepth, wall]);
}
