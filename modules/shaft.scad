28byj48_shaft_collar_radius = 9/2;
28byj48_shaft_collar_height = 1.5;

28byj48_shaft_radius = 5/2;
28byj48_shaft_height = 10;
28byj48_shaft_slotted_width = 3;
28byj48_shaft_slotted_height = 6;

eps = 0.01;
$fn = 60;

module shaft() {
    difference() {
        cylinder(r=28byj48_shaft_radius, h=28byj48_shaft_height);
        translate([-(28byj48_shaft_radius + eps), 28byj48_shaft_slotted_width / 2, 28byj48_shaft_height - 28byj48_shaft_slotted_height]) {
            cube([(28byj48_shaft_radius+eps)*2, 28byj48_shaft_radius, 28byj48_shaft_slotted_height+eps]);
        }
        translate([-(28byj48_shaft_radius + eps), - 28byj48_shaft_radius - (28byj48_shaft_slotted_width / 2), 28byj48_shaft_height - 28byj48_shaft_slotted_height]) {
            cube([(28byj48_shaft_radius+eps)*2, 28byj48_shaft_radius, 28byj48_shaft_slotted_height+eps]);
        }
    }
}

shaft();