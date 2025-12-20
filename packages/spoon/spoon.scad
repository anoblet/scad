include <../common/common.scad>;
use <../modules/primitives/hollow_shell.scad>;

module spoon_holder(
    wall=2,
    outer_w=50,
    outer_h=75,
    outer_z=16,
    rounding=undef,
    slot_w=undef,
    slot_h=undef,
    slot_y=undef
) {
    _rounding = is_undef(rounding) ? outer_w / 4 : rounding;
    _slot_w = is_undef(slot_w) ? outer_w / 4 : slot_w;
    _slot_h = is_undef(slot_h) ? outer_h / 2 : slot_h;
    _slot_y = is_undef(slot_y) ? (outer_h / 4) + wall : slot_y;

    assert(wall >= 0, "wall must be >= 0");
    assert(outer_w > 0 && outer_h > 0 && outer_z > 0, "outer dimensions must be > 0");

    difference() {
        open_top_cuboid_shell(
            size=[outer_w, outer_h, outer_z],
            wall=wall,
            rounding=_rounding,
            anchor=BOT
        );

        // Slot cutout.
        translate([0, _slot_y, 0])
            cuboid([_slot_w, _slot_h, outer_z], rounding=max(0, _rounding / 8), anchor=BOT);
    }
}

module main() {
    spoon_holder();
}

main();