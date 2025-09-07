include <../../common/common.scad>

// Parameters
totalWidth = 296;
columns = 3;
width = (totalWidth / columns);
// depth = totalWidth / columns;
depth = 30;
// width = 24;
height = 48;
thickness = 2;
rounding = thickness / 2;

rotate([0, 0, 45]) {
    difference() {
        cuboid([width, depth, height], except=[BOTTOM,TOP], rounding = rounding);

        translate([0, 0, thickness]){
            cuboid([width - (thickness * 2), depth - (thickness * 2), height]);
        }
    }
}

// // Parameters
// totalWidth = 296;
// columns = 3;
// // width = (totalWidth / columns) * 2;
// // depth = totalWidth / columns;
// outerDepth = totalWidth / columns;
// outerWidth = totalWidth / columns;
// depth = 28;
// width = 24;
// height = 4;
// thickness = 2;
// innerDepth = outerDepth - (2 * thickness);  
// innerWidth = outerWidth - (2 * thickness);
// innerRounding = (innerDepth + innerWidth) / 256;
// outerRounding = (outerDepth + outerWidth) / 256;

// rotate([0, 0, 45]) {
//     difference() {
//         cuboid([outerWidth, outerDepth, height], except=[BOTTOM,TOP], rounding = outerRounding);

//         translate([0, 0, thickness]){
//             cuboid([innerWidth, innerDepth, height], except=[BOTTOM,TOP], rounding = innerRounding);
//         }
//     }
// }

