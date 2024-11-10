include <BOSL2/std.scad>;
include <../common/common.scad>;

$fa = $preview ? 12 : 0.02;
$fs = $preview ? 2 : 0.02;

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

module emptyCylinder(diameter, thickness, height) {
    difference() {
        cylinder(d = diameter, h = height, center = true);
        cylinder(d = diameter - thickness, h = height, center = true);
    }
}

module base() {
    cylinder(d = outerDiameter, h = topHeight, center = true);

    translate([0, 0, (bottomHeight + topHeight) / 2]) {
        difference() {
            cylinder(d = innerDiameter + thickness, h = bottomHeight, center = true);
            cylinder(d = innerDiameter, h = bottomHeight, center = true);
        }
    }
}

difference() {
    base(); 
    circles();
}

cuboid([thickness / 2, innerDiameter, topHeight]);
rotate([0, 0, 45]) {
    cuboid([thickness / 2, innerDiameter, topHeight]);
}
cuboid([innerDiameter, thickness / 2, topHeight]);
rotate([0, 0, 45]) {
    cuboid([innerDiameter, thickness / 2, topHeight]);
}

module circles() {
    union() {
        for ( i = [0 : 5] ){
            emptyCylinder(innerDiameter - ((thickness * 3) * i), thickness * 2, topHeight);
        }
    }
}