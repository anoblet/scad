include <BOSL2/std.scad>
include <BOSL2/joiners.scad>

$fn = 128; // Set the resolution of the model

layerHeight = 0.2;

height = layerHeight * 10;

width = 40;
depth = 170;

dovetailWidth = 15;
dovetailHeight = 8;
dovetailSlide = height;

fillet = 18;

difference() {
    diff() 
        cuboid([width,depth,height]){
            attach(LEFT) dovetail("male", slide=dovetailSlide, width=dovetailWidth, height=dovetailHeight);
            tag("remove")attach(FRONT) dovetail("female", slide=dovetailSlide, width=dovetailWidth, height=dovetailHeight);
            // tag("remove")attach(LEFT) dovetail("female", slide=dovetailSlide, width=dovetailWidth, height=dovetailHeight);
            // attach(FRONT) dovetail("male", slide=dovetailSlide, width=dovetailWidth, height=dovetailHeight);
        }

    translate([(width / 2) - (fillet / 2), (depth / 2) - (fillet / 2), 0])
    cylinder(r=fillet, h= height, center = true);
}

/*
difference() {
    cube([width, depth, height], center = true);

    translate([(width / 2), (depth / 2), 0])
        cylinder(r=fillet, h= height, center = true);
}
*/
