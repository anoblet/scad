include <../common/common_threading.scad>;
use <../modules/assemblies/threaded_standoff.scad>;

scale = 1;

centerDiameter = 100 * scale;
centerHeight = 2.5 * scale;

screwDiameter = 15;
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
        rod=true,
        nut=false,
        direction=-1
    );
}

main();

