$fn = 128;

outerHeight = 20;
innerHeight = 2.5;
border = 2.5;
radius = 50;

difference() {
    cylinder(h = outerHeight, r = radius);
    cylinder(h = outerHeight, r = radius - border);
};

cylinder(h = innerHeight, r = radius - border);