include <../common/common.scad>

coin_diameter = 64;
coin_thickness = 2;
ring_width = 3;
field_diameter = coin_diameter - (ring_width * 2);
field_relief_depth = 0;
flat_preview = false;

crown_scale = 6;
crown_vertical_offset = 0;

x_bar_width = 3.0;
x_angle = 40;
x_length_ratio = 0.9;
x_length = field_diameter * x_length_ratio;
cross_rounding_radius = 1;

preview_cross_lift = 0;

module badge_outline_2d() {
    circle(d = coin_diameter);
}

module badge_field_2d() {
    circle(d = field_diameter);
}

module badge_ring_2d() {
    difference() {
        badge_outline_2d();
        badge_field_2d();
    }
}

module crown_shape_2d() {
    translate([0, crown_vertical_offset]) {
        scale([
            crown_scale,
            crown_scale,
        ]) {
            import("reference/crown-outline.svg", center = true);
        }
    }
}

module clipped_crown_2d() {
    intersection() {
        badge_field_2d();
        crown_shape_2d();
    }
}

module cross_shape_2d() {
    intersection() {
        badge_field_2d();
        round2d(cross_rounding_radius) {
            union() {
                rotate(x_angle) {
                    square([x_length, x_bar_width], center = true);
                }
                rotate(-x_angle) {
                    square([x_length, x_bar_width], center = true);
                }
            }
        }
    }
}

module recessed_field_2d() {
    difference() {
        badge_field_2d();
        union() {
            clipped_crown_2d();
            cross_shape_2d();
        }
    }
}

module badge_body_3d() {
    union() {
        color("black") {
            linear_extrude(height = coin_thickness) {
                badge_ring_2d();
            }
        }

        color("white") {
            linear_extrude(height = coin_thickness - field_relief_depth) {
                recessed_field_2d();
            }
        }

        color("gold") {
            linear_extrude(height = coin_thickness) {
                clipped_crown_2d();
            }
        }

        color("red") {
            translate([0, 0, $preview ? preview_cross_lift : 0]) {
                linear_extrude(height = coin_thickness) {
                    cross_shape_2d();
                }
            }
        }
    }
}

module badge_preview_2d() {
    color("black") {
        badge_ring_2d();
    }

    color("white") {
        recessed_field_2d();
    }

    color("gold") {
        clipped_crown_2d();
    }

    color("red") {
        cross_shape_2d();
    }
}

module main() {
    $fa = 2;
    $fs = 0.25;

    if (flat_preview) {
        badge_preview_2d();
    } else {
        badge_body_3d();
    }
}

main();