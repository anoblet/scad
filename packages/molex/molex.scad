include <../common/common.scad>;

// rotate([180, 0, 0])
// import("molex_reference.stl", center=true);

connectorX = 8.27;
connectorY = 14;
connectorZ = 10.83;

tolerance = 0.4;
wall = 2;

difference() {
    cuboid([connectorX + 2*wall, connectorY * 2, connectorZ + 2*wall]);
    cuboid([connectorX + tolerance, connectorY * 2, connectorZ + tolerance]);
}
