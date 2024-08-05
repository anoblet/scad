include <BOSL2/std.scad>
include <common.scad>

cuboid([(espWidth + wall) * 1.5, espDepth + wall, wall], except = [BOTTOM, TOP], rounding = wall / 2);
translate([((((espWidth + wall) * 1.5) - espWidth - wall) / 2), 0, wall]) {
    cuboid([espWidth, espDepth, wall]);
}
