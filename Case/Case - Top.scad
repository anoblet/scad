esp8266Depth = 48;
uln2003Depth = 34;
wallThickness = 2;

insideWidth = 35;
insideHeight = 82 + /* Divider */ wallThickness;
insideDepth = 25;


caseWidth = insideWidth + (wallThickness * 2);
caseHeight = insideHeight + (wallThickness * 2);
caseDepth = insideDepth + wallThickness;

tabWidth = caseWidth / 2;
tabHeight = 10;

cube([caseWidth, caseHeight, wallThickness], center = true);

// Tab

translate([0, caseHeight / 2, 0]) 
{
    cube([tabWidth, tabHeight, wallThickness], center = true);
}

translate([0, 0, wallThickness]) {
    cube([insideWidth, insideHeight, wallThickness], center = true);
}



