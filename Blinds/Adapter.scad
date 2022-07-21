use <../modules/shaft.scad>

$fn = 60;

adapterHeight = 25;
adapterRadius = 7.5;

hookWidth = 2.75;
hookDepth = 8;
hookHeight = adapterHeight / 2;

divider = 2;

module hook() {
    cube([hookWidth, hookDepth, hookHeight]);
}

difference() {
    cylinder(h = adapterHeight, r = adapterRadius);
    shaft();
    
    translate([-(hookWidth / 2), -(adapterRadius / 2), adapterHeight / 2]) {
        hook();
    }
}