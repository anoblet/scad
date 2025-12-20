include <../common/common.scad>;

module strike_plate(
    x=29,
    y=66,
    z=2,
    inner_x=22.5,
    inner_y=30,
    rounding=2,
    screw_d=5,
    screw_edge_offset=undef
) {
    _screw_edge_offset = is_undef(screw_edge_offset) ? (screw_d * 2) : screw_edge_offset;

    difference() {
        difference() {
            cuboid([x, y, z], except=[BOTTOM, TOP], rounding=rounding);

            union() {
                translate([0, (y / 2) - _screw_edge_offset, 0])
                    cylinder(d=screw_d, center=true, h=z);

                translate([0, -((y / 2) - _screw_edge_offset), 0])
                    cylinder(d=screw_d, center=true, h=z);
            }
        }

        cuboid([inner_x, inner_y, z], except=[BOTTOM, TOP], rounding=rounding);
    }
}

module main() {
    strike_plate();
}

main();