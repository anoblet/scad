esp8266Height = 48;
uln2003Height = 34;
wallThickness = 2;

insideWidth = 35;
insideHeight = 82 + /* Divider */ wallThickness;
insideDepth = 30;


caseWidth = insideWidth + (wallThickness * 2);
caseHeight = insideHeight + (wallThickness * 2);
caseDepth = insideDepth + wallThickness;



difference() {
    cube([caseWidth, caseHeight, caseDepth], center = true);
    translate([0, 0, wallThickness / 2]) {
        cube([insideWidth, insideHeight, insideDepth], center = true);
    };
    
    // Port #1 (USB)
    portOneWidth = insideWidth / 4;
    portOneDepth = 3.125;
    
    translate([0, caseHeight / 2, -(caseDepth / 2) + (portOneDepth / 2) + wallThickness]) {
        cube([portOneWidth, insideHeight / 2, portOneDepth], center = true);
    }
    
    // Port #2 (JST)
    portTwoWidth = insideWidth / 2;
    portTwoDepth = 6.25;
    
    translate([0, -(insideHeight / 2), 0]) {
        cube([portTwoWidth, insideHeight / 2, portTwoDepth], center = true);
    }
}

// Divider
dividerDepth = insideDepth / 4;

translate([0, -((insideHeight / 2) - uln2003Height), -(caseDepth / 2) + (dividerDepth / 2) + wallThickness]) {
    cube([insideWidth, wallThickness, dividerDepth], center = true);
}
