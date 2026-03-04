use <./constants.scad>

module groove() {
    cube([tongueLength, tongueLength, tongueHeight], center = true);
}

module ring() {
    difference() {
        cube([ringWidth, ringDepth, ringHeight], center = true);
        cube([ringWidth - ringThickness, ringDepth - ringThickness, ringHeight], center = true);
    }
}

module tongue() {
    cube([tongueLength - tolerance, tongueLength - tolerance, tongueHeight - tolerance], center = true);
}