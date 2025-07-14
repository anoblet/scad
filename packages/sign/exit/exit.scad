include <../../common/common.scad>

x = 50;
y = 50;
z = 4;

rounding = (x + y) / 20;

cuboid([x, y, z], except=[BOTTOM,TOP], rounding = rounding);