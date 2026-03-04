// Model-facing repo defaults and BOSL2 wiring.
//
// Prefer this file in models: `include <../common/common.scad>`.
// For side-effect-free imports in libraries, use: `include <../common/common_use.scad>`.

include <common_use.scad>

// Use a specific font for text rendering; ensures consistent typography in generated models.
use <NotoSans-VariableFont_wdth,wght.ttf>

// Tessellation policy:
// - Coarser in preview for fast interaction
// - Reasonable default quality for export (override locally inside `main()` when needed)
$fa = $preview ? 12 : 2;
$fs = $preview ? 2 : 0.25;