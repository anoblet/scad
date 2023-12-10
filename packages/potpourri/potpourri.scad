width = 80;
depth = 100;
height = 60;

thickness = 2;

difference() {
    difference() {
        cube([width, depth, height], center = true);
        translate([0, 0, thickness]) {
            cube([width - thickness, depth - thickness, height - thickness], center = true);
        }    
    }

    cube([thickness, depth - (thickness * 2), height], center = true);

    translate([-((width / 4) + (width / 8)  - thickness / 2), 0, 0 ]) {
        cube([thickness, (depth * 2/3) - (thickness / 2) , height], center = true);
    }

    translate([(width / 4) + (width / 8) - thickness / 2, 0, 0 ]) {
        cube([thickness, (depth * 2/3) - (thickness / 2) , height], center = true);
    }

    translate([-((width / 4) - thickness / 2), 0, 0 ]) {
        cube([thickness, depth - (thickness * 2) , height], center = true);
    }

    translate([(width / 4) - thickness / 2, 0, 0 ]) {
        cube([thickness, depth - (thickness * 2) , height], center = true);
    }

    translate([-((width / 8) - thickness / 2), 0, 0 ]) {
        cube([thickness, (depth * 2/3) - (thickness / 2) , height], center = true);
    }

    translate([(width / 8) - thickness / 2, 0, 0 ]) {
        cube([thickness, (depth * 2/3) - (thickness / 2) , height], center = true);
    }
}

