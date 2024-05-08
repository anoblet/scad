$fn = $preview ? 32 : 128;

height = 8;
symbolHeight = 4;

%cylinder(r = 16, center = true, h = height);
linear_extrude(height = symbolHeight)
text("A", halign = "center", valign = "center");