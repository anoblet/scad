layerHeight = 0.2;
scale = 0.25;

blockWidth = 100 * scale;
blockDepth = 100 * scale;
blockHeight = 25 * scale;

connectorWidth = blockWidth / 2 * scale;
connectorDepth = blockDepth / 2 * scale;
connectorHeight = blockHeight * scale;

thickness = 5;
tolerance = layerHeight * 2;

difference([]) {
    cube([blockWidth, blockDepth, blockHeight], center = true);
    
    translate([-(blockWidth / 4), (blockDepth / 2) - (connectorDepth / 2), 0]) {
        cube([connectorWidth, connectorDepth, connectorHeight], center = true);
    }
}
translate([(blockWidth / 4), (blockDepth / 2) + (connectorDepth / 2), 0]) {
    cube([connectorWidth - tolerance, connectorDepth - tolerance, connectorHeight - tolerance], center = true);
}

