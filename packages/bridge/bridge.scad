cubeLength = 10;
bridgeWidth = 25;
bridgeHeight = 1;

translate([0, 0, cubeLength / 2]) {
    cube([bridgeWidth + cubeLength, cubeLength, bridgeHeight], center = true);
}

translate([-((bridgeWidth / 2)), 0]) {
    cube(cubeLength, center = true);
}

translate([bridgeWidth / 2, 0, 0]) {
    cube(cubeLength, center = true);
}