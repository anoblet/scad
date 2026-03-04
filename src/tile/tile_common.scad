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