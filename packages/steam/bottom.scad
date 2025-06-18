include <common.scad>

// Creates a hollow cylinder by subtracting an inner cylinder from an outer one
module emptyCylinder(diameter, thickness, height) {
    difference() {
        cylinder(d = diameter, h = height, center = true);
        cylinder(d = diameter - thickness, h = height, center = true);
    }
}

// Constructs the bottom part of the model with complex subtractions for shape and internal features
module bottom() {
    difference() {
        difference() {
            difference() {
                // Outer shell with rounded and teardrop profile
                cyl(l = outerLength, d = outerDiameter, rounding1 = outerDiameter / 8, teardrop = true);
                // Subtracts the inner cavity, offset by thickness, with similar profile
                translate([0, 0, thickness]) {
                    cyl(l = innerLength + thickness, d = innerDiameter, rounding1 = innerDiameter / 8, teardrop = true);
                }
            }
            // Removes a cylindrical section at one end to create an opening or recess
            translate([0, 0, outerLength / 2]) {
                difference() {
                    cyl(l = outerLength, d = outerDiameter + 0.001);
                    cyl(l = outerLength + thickness, d = innerDiameter + thickness);
                }
            }
        }

        // Optional: Would add concentric hollow cylinders for reinforcement or design, currently disabled
        // union() {
        //     for ( i = [0 : 3] ){
        //         emptyCylinder((innerDiameter - (innerDiameter / 8) - thickness - ((thickness * 8) * i)), thickness, outerLength);
        //     }
        // }
    }

    // Adds two perpendicular cuboids at the base, likely for structural support or alignment
    translate([0, 0, -(outerLength - thickness) / 2]) {
        cuboid([thickness, innerDiameter - (innerDiameter / 8), thickness]);
        cuboid([innerDiameter - (innerDiameter / 8), thickness, thickness]);
    }
}

// Render the bottom module as the main output
bottom();