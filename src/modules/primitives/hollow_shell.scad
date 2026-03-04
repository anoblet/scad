include <../../common/common_use.scad>;

module open_top_cuboid_shell(
    size,
    wall=2,
    rounding=0,
    inner_rounding=undef,
    floor=undef,
    anchor=BOT
) {
    _floor = is_undef(floor) ? wall : floor;
    _inner_rounding = is_undef(inner_rounding) ? max(0, rounding - wall) : inner_rounding;

    assert(is_list(size) && len(size) == 3, "size must be a 3-element [x,y,z] list.");
    assert(wall >= 0, "wall must be >= 0");
    assert(_floor >= 0, "floor must be >= 0");
    assert(size[0] > 2 * wall, "size.x too small for wall");
    assert(size[1] > 2 * wall, "size.y too small for wall");
    assert(size[2] > _floor, "size.z too small for floor");

    difference() {
        cuboid(size, rounding=rounding, except=[BOTTOM, TOP], anchor=anchor);

        up(_floor)
            cuboid(
                [size[0] - 2 * wall, size[1] - 2 * wall, size[2]],
                rounding=_inner_rounding,
                except=[BOTTOM, TOP],
                anchor=anchor
            );
    }
}
