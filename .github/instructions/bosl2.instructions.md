# Copilot Instructions for BOSL2 (Belfry OpenSCAD Library v2)

## Overview
- BOSL2 is a comprehensive OpenSCAD library that simplifies and extends modeling capabilities beyond native OpenSCAD.
- Use BOSL2 for shorthands, attachments, rounding/filleting, complex object support, building blocks, texturing, parts library, geometrical operations, and programming aids.
- Always refer to the [BOSL2 Wiki](https://github.com/BelfrySCAD/BOSL2/wiki) for up-to-date documentation, tutorials, and cheat sheets.

## Usage Guidelines
- **Importing BOSL2**: Use `use <BOSL2/std.scad>` to access standard modules and functions.
- **Shorthands**: Prefer BOSL2 shorthands (e.g., `up(x)`, `rot()`) for readability and maintainability.
- **Attachments**: Use attachment features to position components relative to each other. See [Attachments Tutorial](https://github.com/BelfrySCAD/BOSL2/wiki/Tutorial-Attachment-Overview).
- **Rounding/Filleting**: Use BOSL2 modules like `cuboid()`, `offset_sweep()`, and `prism_connector()` for rounded edges and fillets.
- **Complex Objects**: Use `path_sweep()`, `skin()`, and `vnf_vertex_array()` for advanced modeling. Explore Beziers, NURBS, and Metaballs for organic shapes.
- **Building Blocks**: Use BOSL2's extended primitives (prisms, tubes, etc.) and options for rounded edges and holes.
- **Texturing**: Apply textures and images using BOSL2's texturing features for embossing and patterning.
- **Parts Library**: Use ready-made modules for gears, threads, screws, clips, hinges, and more.
- **Geometrical Operations**: Use BOSL2 for operations on 2D/3D data, such as rounded paths, intersections, and offsets.
- **Programming Aids**: Leverage BOSL2's math, geometry, and utility modules for advanced calculations and transformations.

## Best Practices
- Always check the [Function Index](https://github.com/BelfrySCAD/BOSL2/wiki/AlphaIndex) and [Cheat Sheet](https://github.com/BelfrySCAD/BOSL2/wiki/CheatSheet) before implementing new features.
- Use [Table of Contents](https://github.com/BelfrySCAD/BOSL2/wiki/TOC) and [Topics Index](https://github.com/BelfrySCAD/BOSL2/wiki/Topics) for quick navigation.
- Follow conventions and examples from BOSL2 tutorials and example files.
- Prefer BOSL2 modules over custom code for common modeling tasks.
- Ensure BOSL2 is installed in the correct OpenSCAD library path (see Installation section in the wiki).

## Installation
- Download the latest BOSL2 release from [GitHub](https://github.com/BelfrySCAD/BOSL2/archive/refs/heads/master.zip).
- Unpack and rename the directory to `BOSL2`.
- Move it to your OpenSCAD library directory (see [Installation Guide](https://github.com/BelfrySCAD/BOSL2/wiki/Home#installation)).
- Restart OpenSCAD to recognize the library.

## Additional Resources
- [BOSL2 Wiki](https://github.com/BelfrySCAD/BOSL2/wiki)
- [Tutorials](https://github.com/BelfrySCAD/BOSL2/wiki/Tutorials)
- [Discussions](https://github.com/BelfrySCAD/BOSL2/discussions)
- [Issues](https://github.com/BelfrySCAD/BOSL2/issues)

## Synergistic Libraries
- Consider using [Pathbuilder](https://github.com/dinther/pathbuilder), [Attachable Text3d](https://github.com/jon-gilbert/openscad_attachable_text3d), and [JL_SCAD](https://github.com/lijon/jl_scad) for extended functionality.

---
For any BOSL2-related modeling, always follow these guidelines and consult the official documentation for updates and advanced techniques.
