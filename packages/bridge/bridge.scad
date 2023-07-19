cubeLength = 5;
bridgeWidth = 150;
bridgeHeight = 0.8;

translate([0, 0, cubeLength / 2]) {
    cube([bridgeWidth + cubeLength, cubeLength, bridgeHeight], center = true);
}

translate([-((bridgeWidth / 2)), 0]) {
    cube(cubeLength, center = true);
}

translate([bridgeWidth / 2, 0, 0]) {
    cube(cubeLength, center = true);
}