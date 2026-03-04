include <constants.scad>;

module box() {
    difference() {
        difference() {
            cube([width, depth, height], center = true);
            translate([0, 0, thickness]) {
                cube([width - thickness, depth - thickness, height - thickness], center = true);
            }    
        }

        cube([thickness, depth - (thickness * 2), height], center = true);

        translate([-((width / 4) + (width / 8)  - thickness / 2), 0, 0 ]) {
            cube([thickness, (depth * 2/3) - (thickness / 2) , height], center = true);
        }

        translate([(width / 4) + (width / 8) - thickness / 2, 0, 0 ]) {
            cube([thickness, (depth * 2/3) - (thickness / 2) , height], center = true);
        }

        translate([-((width / 4) - thickness / 2), 0, 0 ]) {
            cube([thickness, depth - (thickness * 2) , height], center = true);
        }

        translate([(width / 4) - thickness / 2, 0, 0 ]) {
            cube([thickness, depth - (thickness * 2) , height], center = true);
        }

        translate([-((width / 8) - thickness / 2), 0, 0 ]) {
            cube([thickness, (depth * 2/3) - (thickness / 2) , height], center = true);
        }

        translate([(width / 8) - thickness / 2, 0, 0 ]) {
            cube([thickness, (depth * 2/3) - (thickness / 2) , height], center = true);
        }
    }

    module leg()  {
        cube([legWidth, legDepth, legHeight], center = true);
    }

    // Legs
    translate([-((width / 2) - (legWidth / 2)), -((depth / 2) - (legDepth / 2)), -(height / 2) ]) {
        leg();
    }

    translate([((width / 2) - (legWidth / 2)), -((depth / 2) - (legDepth / 2)), -(height / 2) ]) {
        leg();
    }

    translate([-((width / 2) - (legWidth / 2)), ((depth / 2) - (legDepth / 2)), -(height / 2) ]) {
        leg();
    }

    translate([((width / 2) - (legWidth / 2)), ((depth / 2) - (legDepth / 2)), -(height / 2) ]) {
        leg();
    }
}

box();