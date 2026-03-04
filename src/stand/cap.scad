include <../common/common_threading.scad>;
use <../modules/assemblies/threaded_standoff.scad>;

scale = 1;

centerDiameter = 30 * scale;
centerHeight = 10 * scale;

screwDiameter = centerDiameter / 2;
screwHeight = 10 * scale;

pitch = screwHeight / 5;
slop = 0.25;

module main(fn_override=undef) {
    $fn = is_undef(fn_override) ? 0 : fn_override;

    threaded_standoff(
        center_d=centerDiameter,
        center_h=centerHeight,
        rod_d=screwDiameter,
        rod_h=screwHeight,
        pitch=pitch,
        rod=false,
        nut=true,
        nut_h=screwHeight,
        slop=slop,
        direction=1
    );
}

main();
