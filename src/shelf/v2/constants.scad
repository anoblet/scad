$fn = 128;

layerHeight = 0.2;

pitch = 1.25;
scale = 0.5;
slop = 0.25;
tolerance = 0.4;

blockLength = 64;
blockHeight = blockLength / 4;

tongueLength = blockHeight / 2;
tongueHeight = blockHeight / 2;

// Ring
ring = false;
ringWidth = tongueLength;
ringDepth = tongueLength;
ringHeight = blockHeight / 2;
ringThickness = 7.5 * scale;

screwDiameter = blockLength / 4;
screwHeight = blockHeight / 2;

pipeDiameter = blockLength / 2;
pipeHeight = 100;

poleLength = blockHeight;
pinLength = blockHeight / 2;

// Refactor
pipeLength = poleLength;
