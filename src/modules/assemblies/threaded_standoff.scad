include <../../common/common_use.scad>;
include <../../../lib/BOSL2/threading.scad>;

module threaded_standoff(
    center_d,
    center_h,
    rod_d,
    rod_h,
    pitch,
    rod=true,
    nut=true,
    nut_h=undef,
    slop=0.25,
    direction=-1
) {
    _nut_h = is_undef(nut_h) ? rod_h : nut_h;

    assert(center_d > 0, "center_d must be > 0");
    assert(center_h >= 0, "center_h must be >= 0");
    assert(rod_d > 0, "rod_d must be > 0");
    assert(rod_h > 0, "rod_h must be > 0");
    assert(pitch > 0, "pitch must be > 0");
    assert(_nut_h > 0, "nut_h must be > 0");
    assert(direction == 1 || direction == -1, "direction must be 1 or -1");

    // Rod centered at origin.
    if (rod) {
        threaded_rod(d=rod_d, height=rod_h, pitch=pitch, anchor=CENTER);
    }

    // Center cylinder.
    if (center_h > 0) {
        translate([0, 0, direction * (rod_h / 2 + center_h / 2)])
            cylinder(center=true, d=center_d, h=center_h);
    }

    // Square nut section.
    if (nut) {
        translate([0, 0, direction * ((rod_h / 2) + center_h + (_nut_h / 2))])
            intersection() {
                cylinder(center=true, d=center_d, h=_nut_h);
                threaded_nut(
                    nutwidth=center_d * 2,
                    id=rod_d,
                    h=_nut_h,
                    pitch=pitch,
                    $slop=slop,
                    shape="square",
                    anchor=CENTER
                );
            }
    }
}
