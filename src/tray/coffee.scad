include <../common/common.scad>;
use <../modules/primitives/hollow_shell.scad>;

module coffee_tray(
    wall=2,
    outer_w=192,
    outer_d=192,
    outer_h=10,
    rounding=undef
) {
    _rounding = is_undef(rounding) ? outer_w / 64 : rounding;

    open_top_cuboid_shell(
        size=[outer_w, outer_d, outer_h],
        wall=wall,
        rounding=_rounding,
        anchor=BOT
    );
}

module main() {
    coffee_tray();
}

main();