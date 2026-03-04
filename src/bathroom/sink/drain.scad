include <../../common/common.scad>;

// sessionId: 20251218045327

function _pick(v, dflt) = is_undef(v) ? dflt : v;

module _cross2d(len, w) {
    union() {
        square([len, w], center=true);
        rotate(90) square([len, w], center=true);
    }
}

module _annulus2d(ri, ro) {
    difference() {
        circle(r=ro);
        circle(r=ri);
    }
}

module _annular_slot_mask_2d(pattern_ro, hub_r, slot_w, web_w, spoke_w) {
    slot_pitch = slot_w + web_w;
    slot_count = max(1, floor((pattern_ro - (hub_r + web_w)) / slot_pitch));
    cross_len = pattern_ro * 2 + 2;

    difference() {
        union() {
            for (i = [0 : slot_count - 1]) {
                ri = hub_r + web_w + i * slot_pitch;
                ro = min(ri + slot_w, pattern_ro);
                if (ro > ri && ri < pattern_ro) {
                    _annulus2d(ri, ro);
                }
            }
        }

        // Remove cross from the cut-mask so the cross remains solid.
        _cross2d(cross_len, spoke_w);
    }
}

module _filter_plate(
    flange_d,
    flange_th,
    rim_w,
    hub_d,
    slot_w,
    web_w,
    spoke_w,
    edge_chamfer=0.8
) {
    pattern_ro = (flange_d / 2) - rim_w;
    hub_r = hub_d / 2;

    difference() {
        cyl(d=flange_d, h=flange_th, chamfer=edge_chamfer, anchor=BOT);

        // Cut-through slots.
        translate([0, 0, -0.05])
        linear_extrude(height=flange_th + 0.10)
            _annular_slot_mask_2d(pattern_ro=pattern_ro, hub_r=hub_r, slot_w=slot_w, web_w=web_w, spoke_w=spoke_w);
    }
}

module drain_plug(
    preset="bathroom",

    flange_d=undef,
    flange_th=2.4,
    rim_w=3.0,

    insert_d=undef,
    insert_h=undef,
    insert_taper=0.8,
    insert_chamfer=0.8,

    slot_w=1.6,
    web_w=1.4,
    spoke_w=3.0,
    hub_d=12,

    handle_d=14,
    handle_h=6,
    handle_chamfer=1.0
) {
    // Bathroom lavatory defaults (mm). Kitchen is provided as an optional preset.
    _flange_d = _pick(flange_d, preset == "kitchen" ? 112 : 54);
    _insert_d = _pick(insert_d, preset == "kitchen" ? 86.5 : 39.5);
    _insert_h = _pick(insert_h, preset == "kitchen" ? 16 : 10);

    pattern_ro = (_flange_d / 2) - rim_w;
    assert(pattern_ro > (hub_d / 2 + slot_w + web_w), "Filter pattern too dense for current flange/rim/hub/slot settings.");
    assert(flange_th >= 1.6, "flange_th is too thin for typical FDM.");

    union() {
        // Print orientation: flange is the bed-contact surface (z=0).
        _filter_plate(
            flange_d=_flange_d,
            flange_th=flange_th,
            rim_w=rim_w,
            hub_d=hub_d,
            slot_w=slot_w,
            web_w=web_w,
            spoke_w=spoke_w
        );

        // Tapered insertion stem.
        up(flange_th)
            cyl(
                d1=_insert_d,
                d2=max(_insert_d - 2 * insert_taper, 1),
                h=_insert_h,
                chamfer1=insert_chamfer,
                anchor=BOT
            );

        // Simple pull knob for removability.
        if (handle_h > 0) {
            up(flange_th + _insert_h)
                cyl(d=handle_d, h=handle_h, chamfer=handle_chamfer, anchor=BOT);
        }
    }
}

module main() {
    drain_plug();
}

main();