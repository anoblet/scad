// Drain plug for bathroom sink. Contentric rings to filter debris.
// Uses TSDoc syntax for documentation.

include <../../common/common.scad>;

/**
 * Inner diameter of the drain plug.
 * @type {number}
 */
innerDiameter = 40;

/**
 * Lip size of the drain plug.
 * @type {number}
 */
outerDiameter = 60;

/**
 * Thickness of the drain plug.
 * @type {number}
 */
thickness = 2;

/**
 * Height of the drain plug.
 * @type {number}
 */
height = 50;

// Creates a ring with specified inner diameter, height, and thickness
module ring(innerDiameter, height, thickness) {
    difference() {
        cyl(d=innerDiameter, h=height);
        cyl(d=innerDiameter - (thickness * 2), h=height);
    }
}

// Generates concentric rings. Parameters: number of rings, ring width
module concentric_rings(numRings, ringWidth, height, lip) {
    for (i = [0 : numRings - 1]) {
        ring(innerDiameter + (i * ringWidth), height, ringWidth);
    }
}

// Plug, concentric rings to filter debris. Wider lip at the base to cover drain opening.
module plug() {
    rings = 5;
    ringWidth = 3;

    difference() {
        // Base
        cyl(d=outerDiameter, h = thickness);

        union() {
            // Cross
            union() {
                cuboid([outerDiameter, thickness, thickness]);
                rotate([0, 0, 90])
                cuboid([outerDiameter, thickness, thickness]);
            }

            // Concentric Rings
            concentric_rings(rings, ringWidth, height - thickness, innerDiameter);
        }

    }
}

plug();