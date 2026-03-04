include <BOSL2/std.scad>

$fa = $preview ? 12 : 0.01;
$fs = $preview ? 2 : 0.01;

sensorWidth = 24;
sensorDepth = 4;
sensorHeight = 12;

wall = 2;

espWidth = 54;
espDepth = 28;
espHeight = 30;

rounding = wall / 2;

plugWidth = wall;
plugDepth = 8;
plugHeight = 4;

blockLength = wall * 2;