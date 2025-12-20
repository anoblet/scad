include <../common/common_use.scad>;

module shaft_28byj48(
    tolerance=0,
    shaft_d=5,
    shaft_h=10,
    slot_w=3,
    slot_h=6,
    fn_override=undef
) {
    eps = 0.01;

    assert(tolerance >= 0, "tolerance must be >= 0");
    assert(shaft_d > 0, "shaft_d must be > 0");
    assert(shaft_h > 0, "shaft_h must be > 0");
    assert(slot_w >= 0, "slot_w must be >= 0");
    assert(slot_h >= 0 && slot_h <= shaft_h, "slot_h must be in [0, shaft_h]");

    shaft_r = shaft_d / 2;
    slotted_w = slot_w + tolerance;

    difference() {
        // Default orientation: Z+ up, base at z=0.
        cyl(d=shaft_d, h=shaft_h, anchor=BOT, $fn=fn_override);

        // Two flats to form the typical 28BYJ-48 shaft profile.
        translate([-(shaft_r + eps), slotted_w / 2, shaft_h - slot_h])
            cube([(shaft_r + eps) * 2, shaft_r, slot_h + eps]);

        translate([-(shaft_r + eps), -shaft_r - (slotted_w / 2), shaft_h - slot_h])
            cube([(shaft_r + eps) * 2, shaft_r, slot_h + eps]);
    }
}

// Backward-compatible alias.
module shaft(tolerance=0, fn_override=undef) {
    shaft_28byj48(tolerance=tolerance, fn_override=fn_override);
}
