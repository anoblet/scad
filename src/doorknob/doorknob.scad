include <../common/common.scad>;

innerRadius = 0.75;
outerRadius = 1.25;

difference() {
    cyl(r = outerRadius, l = 1);
    cyl(r = innerRadius, l = 1);
}