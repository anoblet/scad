include <BOSL2/std.scad>;
include <../../common/common.scad>;

// Use custom font
use <fonts\DancingScript-Regular.ttf>

symbolHeight = 2;

width = 192;
height = 108;

difference() {
    color("black") { 
      cuboid([192, 108, symbolHeight]);
    }

    color("white") {
      linear_extrude(height = symbolHeight) {
        text("Welcome!", font = "Dancing Script:style=Regular", halign = "center", valign = "center");
    }
  }
}
