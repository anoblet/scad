$fn = 128; // Set the resolution of the model

layerHeight = 0.2;

height = layerHeight * 1;

width = 50;
depth = 170;

fillet = 18;

difference() {
    cube([width, depth, height], center = true);

    translate([(width / 2), (depth / 2), 0])
        cylinder(r=fillet, h= height, center = true);
}
