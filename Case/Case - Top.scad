esp8266Depth = 48;
uln2003Depth = 34;
wallThickness = 2;

insideWidth = 35;
insideDepth = 82 + /* Divider */ wallThickness;
insideHeight = 25;


caseWidth = insideWidth + (wallThickness * 2);
caseDepth = insideDepth + (wallThickness * 2);
caseHeight = insideHeight + wallThickness;

cube([caseWidth, caseDepth, wallThickness], center = true);
translate([0, 0, wallThickness]) {
    cube([insideWidth, insideDepth, wallThickness], center = true);
}



