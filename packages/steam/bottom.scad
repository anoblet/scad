include <common.scad>

module emptyCylinder(diameter, thickness, height) {
    difference() {
        cylinder(d = diameter, h = height, center = true);
        cylinder(d = diameter - thickness, h = height, center = true);
    }
}

module bottom() {
    difference() {
        difference() {
            difference() {
                cyl(l = outerLength, d = outerDiameter, rounding1 = outerDiameter / 8, teardrop = true);
                translate([0, 0, thickness]) {
                    cyl(l = innerLength + thickness, d = innerDiameter, rounding1 = innerDiameter / 8, teardrop = true);
                }
            }
            translate([0, 0, outerLength / 2]) {
                difference() {
                    cyl(l = outerLength, d = outerDiameter + 0.001);
                    cyl(l = outerLength + thickness, d = innerDiameter + thickness);
                }
            }
        }

        union() {
            for ( i = [0 : 3] ){
                emptyCylinder((innerDiameter - (innerDiameter / 8) - thickness - ((thickness * 8) * i)), thickness, outerLength);
            }
        }
    }

    translate([0, 0, -(outerLength - thickness) / 2]) {
        cuboid([thickness, innerDiameter - (innerDiameter / 8), thickness]);
        cuboid([innerDiameter - (innerDiameter / 8), thickness, thickness]);
    }
}

bottom();
