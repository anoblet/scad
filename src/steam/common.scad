include <../common/common.scad>

$fa = $preview ? 12 : 0.32;
$fs = $preview ? 2 : 0.32;

thickness = 2;
outerLength = 16;
innerLength = outerLength - thickness;
outerDiameter = 48;
innerDiameter = outerDiameter - thickness * 2;