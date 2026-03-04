include <../common/common.scad>

y = 25;

x1 = 28;
z1 = 5;

x2 = 14;
z2 = 13;

connectionLength = 10;

male = true;
female = true;

pegDiameter = 5;

cuboid([x1, y, z1]);

translate([0, 0, (z2 + z1) / 2]) {
    difference() {
        cuboid([x2, y, z2]);
    }
}

// Male
if(male) {
    translate([0, (y + connectionLength) / 2, 0]) {
        difference() {
            cuboid([x1, connectionLength, z1]);
            cyl(h = z1 + 1, d = pegDiameter);
        }
    }
}

// Female
if(female) {
    translate([0, -(y + connectionLength) / 2, (z1 + z2) / 2]) {
        difference() {
            color("red") cuboid([x2, connectionLength, z2]);

            translate([0, 0, 0]) {
                cyl(h = z2, d = pegDiameter);
            }
        }
    }
}