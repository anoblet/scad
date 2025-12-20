include <../../common/common_use.scad>;
include <../../../lib/BOSL2/threading.scad>;

module threaded_rod_with_square_nut(
    rod_d,
    rod_h,
    pitch,
    nut_outer_d,
    nut_h,
    slop=0.25
) {
    assert(rod_d > 0, "rod_d must be > 0");
    assert(rod_h > 0, "rod_h must be > 0");
    assert(pitch > 0, "pitch must be > 0");
    assert(nut_outer_d > 0, "nut_outer_d must be > 0");
    assert(nut_h > 0, "nut_h must be > 0");

    // Threaded rod centered at the origin (matches typical BOSL2 defaults).
    threaded_rod(d=rod_d, height=rod_h, pitch=pitch, anchor=CENTER);

    // Square nut at the bottom end of the rod, clipped inside a round envelope.
    translate([0, 0, -((rod_h / 2) + (nut_h / 2))])
        intersection() {
            cyl(d=nut_outer_d, h=nut_h, anchor=CENTER);
            threaded_nut(
                nutwidth=nut_outer_d * 2,
                id=rod_d,
                h=nut_h,
                pitch=pitch,
                $slop=slop,
                shape="square",
                anchor=CENTER
            );
        }
}
