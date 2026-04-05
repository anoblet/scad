include <../common/common.scad>

emit_main = is_undef($no_kings_emit_main) ? true : $no_kings_emit_main;

diameter = 50;
thickness = 2;
cross_depth = 3;
crown_depth = 3;
base_inset = 0.5;

svg_outer_visual_diameter = 1608;
svg_outline_stroke = 88;
svg_crown_scale = 56;
svg_crown_center_y = 0;
cross_angle = 35;

outline_thickness = diameter * svg_outline_stroke / svg_outer_visual_diameter;

cross_width = diameter * 186 / svg_outer_visual_diameter;
cross_length = diameter * 1270 / svg_outer_visual_diameter;
crown_width = diameter * 18 * svg_crown_scale / svg_outer_visual_diameter;
crown_height = diameter * 16 * svg_crown_scale / svg_outer_visual_diameter;
crown_center_y = diameter * svg_crown_center_y / svg_outer_visual_diameter;

minimum_base_thickness = thickness > 1 ? 1 : max(thickness * 0.5, 0.6);
relief_height = min(max(base_inset, 0.2), max(thickness - minimum_base_thickness, 0.2));
effective_cross_height = min(cross_depth, relief_height);
effective_crown_height = min(crown_depth, relief_height);
effective_outline_height = min(max(relief_height * 0.75, 0.2), relief_height);
base_thickness = max(thickness - max(effective_cross_height, effective_crown_height, effective_outline_height), 0.6);

module capsule_2d(length, width) {
    hull() {
        translate([-(length - width) / 2, 0]) {
            circle(d = width);
        }

        translate([(length - width) / 2, 0]) {
            circle(d = width);
        }
    }
}

module outline_shape() {
    difference() {
        circle(d = diameter);
        circle(d = diameter - (outline_thickness * 2));
    }
}

module crown_shape() {
    translate([0, -crown_center_y]) {
        resize([crown_width, crown_height]) {
            import("reference/crown-outline.svg", center = true);
        }
    }
}

module cross_shape() {
    union() {
        rotate(-cross_angle) {
            capsule_2d(cross_length, cross_width);
        }

        rotate(cross_angle) {
            capsule_2d(cross_length, cross_width);
        }
    }
}

module badge_outline_2d() {
    outline_shape();
}

module badge_crown_2d() {
    crown_shape();
}

module badge_cross_2d() {
    cross_shape();
}

module badge_face_2d() {
    union() {
        badge_outline_2d();
        badge_crown_2d();
        badge_cross_2d();
    }
}

module relief() {
    translate([0, 0, base_thickness]) {
        color("black") {
            linear_extrude(height = effective_outline_height) {
                outline_shape();
            }
        }

        color([1, 0.843, 0]) {
            linear_extrude(height = effective_crown_height) {
                crown_shape();
            }
        }

        color("red") {
            linear_extrude(height = effective_cross_height) {
                cross_shape();
            }
        }
    }
}

module badge() {
    union() {
        color("white") {
            linear_extrude(height = base_thickness) {
                circle(d = diameter);
            }
        }

        relief();
    }
}

module main() {
    $fa = 2;
    $fs = 0.25;

    badge();
}

if (emit_main) {
    main();
}