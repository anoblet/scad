<role>

- Build and maintain parametric OpenSCAD models for 3D printing.
- Prefer BOSL2 for primitives, transforms, and utility helpers.
- Keep designs reusable, composable, and easy to export (STL/PNG).

</role>

<constraints>

- Units are millimeters; Z is up.
- Prefer BOSL2 helpers over raw OpenSCAD where practical.
- Reuse shared defaults via packages/common/common.scad.
	- Common include patterns: include <../common/common.scad> (package root) or include <../../common/common.scad> (deeper).
- Use include vs use intentionally:
	- use for libraries/modules (no top-level geometry).
	- include only for shared settings/constants or when geometry-at-include-time is intended.
- Keep models parametric:
	- Expose top-level parameters with sensible defaults.
	- Avoid magic numbers; name derived dimensions.
- Keep tessellation reasonable:
	- packages/common/common.scad sets global $fa/$fs; override locally if exports get slow or huge.
- Export with the pinned OpenSCAD binary in bin/.
	- If FUSE is unavailable, set APPIMAGE_EXTRACT_AND_RUN=1.
- Treat .copilot/sessions/<sessionId>/ as the source of truth for agent outputs and logs.
- Symlinks are managed by link.json (e.g., .github/agents/* and .vscode/*); avoid hand-editing symlinked targets.

</constraints>

<instructions>

- Repo layout
	- packages/: individual projects/models, usually one directory per object.
	- packages/common/common.scad: shared BOSL2 include + repo-wide defaults.
	- lib/BOSL2/: vendored BOSL2.
	- bin/: pinned OpenSCAD AppImage for consistent CI/local exports.
	- copilot/: agent framework, prompts, instructions, and link tooling.

- Modeling conventions
	- Prefer a clear entrypoint: module main() { ... } then call main(); at EOF.
	- Prefer BOSL2 transforms (up(), down(), left(), right(), fwd(), back(), etc.) and shapes (cuboid(), cyl(), etc.).
	- Keep modules side-effect free unless explicitly a “script” file.
	- Name parameters descriptively; group related parameters together.

- Includes and BOSL2
	- Recommended default: include packages/common/common.scad (relative include) to get BOSL2 + defaults.
	- Avoid mixing include <BOSL2/...> with relative lib/BOSL2 includes within the same model unless there’s a strong reason.

- Exporting (CLI)
	- STL example:
		- APPIMAGE_EXTRACT_AND_RUN=1 bin/OpenSCAD-2025.12.17.ai30001-x86_64.AppImage -o out.stl path/to/model.scad
	- PNG example:
		- APPIMAGE_EXTRACT_AND_RUN=1 bin/OpenSCAD-2025.12.17.ai30001-x86_64.AppImage -o out.png --imgsize 1200,900 --projection=o path/to/model.scad

- Agent workflow
	- Prefer nested instruction files when needed (e.g., packages/agents.md) to override root guidance.
	- Session artifacts live under .copilot/sessions/<sessionId>/ (research.md, plan.md, implement.md, review.md, etc.).
	- If link.json references missing targets (e.g., a missing agent markdown), fix the source in copilot/agents/ rather than patching symlinks.

</instructions>
