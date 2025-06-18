// Import BOSL2 standard library for utility modules and functions
include <BOSL2/std.scad>

// Import custom battery module from relative path for battery-related geometry
include <../battery/battery.scad>

// Use a specific font for text rendering; ensures consistent typography in generated models
use <NotoSans-VariableFont_wdth,wght.ttf>

// Set angular and segment resolution for preview and final render
// $fa and $fs control facet angle and size for smoother or faster rendering
$fa = $preview ? 12 : 0.01;
$fs = $preview ? 2 : 0.01;