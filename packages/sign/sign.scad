$fn = $preview ? 32 : 64;

height = 2;

baseDiameter = 50;
imageDiameter = 40;

// Image

module image() {
    import("sun-svgrepo-com.svg", center = true);
}

// Border

// color("black") {
//     linear_extrude(height = height) {
//         offset(delta = 2){
//             projection() {
//                 image();
//             }
//         }
//     }
// }

// color("white") {
//     linear_extrude(height = height) {
//         projection() {
//             image();
//         }
//     }
// }

// Base

color("black") {
    cylinder(d=baseDiameter, h=height, center=true);
}

color("white") {
    projection(cut = true) {
    resize([imageDiameter, imageDiameter, height]) {
        linear_extrude() {
            // projection() {
                image();
            // }
        }
    }}
}


