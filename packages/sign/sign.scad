use <NotoSans-VariableFont_wdth,wght.ttf>

$fn = $preview ? 32 : 64;

height = 2;

baseDiameter = 24;

// Image

module image() {
    import("svg/toilet.svg", center = true);
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

%color("black") {
    cylinder(d=baseDiameter, h=height);
}


color("white") {
    // echo(textmetrics(text="A", font="Noto Sans"/, size=12, halign="center", valign="center"));
    linear_extrude(height = 1) {
        text("MAIL", font="Noto Sans", size=12, halign="center", valign="center");
    }
}

// color("white") {
//     // projection(cut = true) {
//     resize([imageDiameter, imageDiameter, height]) {
//         linear_extrude() {
//             // projection() {
//                 image();
//             // }
//         }
//     }
// }


