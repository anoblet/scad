include <../common/common.scad>

design_size_mm = 52;
relief_height_mm = 1.2;
cross_bar_width_mm = 6;
cross_angle_deg = 45;
reference_viewbox_size = 24;
cross_length_mm = design_size_mm * 1.3;

module crown_2d() {
    scale(design_size_mm / reference_viewbox_size) {
        import("reference/crown-outline.svg", center = true);
    }
}

module prohibition_2d() {
    for (rotation = [-cross_angle_deg, cross_angle_deg]) {
        rotate(rotation) {
            square([cross_length_mm, cross_bar_width_mm], center = true);
        }
    }
}

module relief_2d() {
    union() {
        crown_2d();
        prohibition_2d();
    }
}

module main() {
    linear_extrude(height = relief_height_mm, center = false) {
        relief_2d();
    }
}

main();