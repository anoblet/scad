include <BOSL2/std.scad>;
include <../common/common.scad>;

$fa = $preview ? 12 : 0.01;
$fs = $preview ? 2 : 0.01;

innerDiameter = 40;

bottomHeight = 10;
topHeight = 2;

outerDiameter = 76;
bordorDiameter = 10;

thickness = 2;
symbolLength = 4;

spacing = 4;

module circleGrid() {
    inside = circle($fn=6, d=innerDiameter - symbolLength);
    translate([0, 0, -(thickness / 2)]) {
        grid_copies(inside=inside, size = innerDiameter - spacing, spacing=spacing, stagger = true) {
            zrot(180/6) cylinder($fn = 6, d=symbolLength, h=thickness);
        }
    }
}

module hexagonGrid () {
    intersection() {
        cylinder($fn = 6, d = innerDiameter, h = topHeight, center = true);
    // Hexagon grid
        inside = circle(d=innerDiameter);
        translate([0, 0, -(thickness / 2)]) {
            grid_copies(spacing=4, stagger=true, inside=inside) {
                zrot(180/6) {
                    cylinder(h=thickness, d=symbolLength);
                }
            }
        }
    }
}

difference() {
    cylinder(d = outerDiameter, h = topHeight, center = true);

    // hexagonGrid();
    circleGrid();
}

translate([0, 0, (bottomHeight + topHeight) / 2]) {
    difference() {
        cylinder(d = innerDiameter + thickness, h = bottomHeight, center = true);
        cylinder(d = innerDiameter, h = bottomHeight, center = true);
    }
}