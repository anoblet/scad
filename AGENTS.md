# AGENTS.md

## Purpose and Scope

This file defines root-level instructions for coding agents working in this repository.
Use it for repository-wide changes (for example: `export.manifest.json`, root scripts, docs, and policies).

## Instruction Precedence

Apply instructions in this order:

1. Explicit user request in chat.
2. Nearest `AGENTS.md` to the files you are changing.
3. Parent/global instruction files.

When instructions conflict, follow the higher-priority item.

## Repository Map

- `src/`: OpenSCAD models and model families.
- `packages/`: shared/common package content used by this repository.
- `docs/`: conventions, SCAD contract, export workflow, and inventory docs.
- `scripts/`: export and inventory automation (`scad-export.mjs`, `scad-inventory.mjs`).
- `export.manifest.json`: export target definitions and checks.
- `bin/`: pinned OpenSCAD AppImage for reproducible exports.
- `.copilot/sessions/`: per-session artifacts (`prompt.md`, `research.md`, `question.md`, `plan.md`, `implement.md`).
- `copilot/`: instruction and prompt resources; treat as reference material unless task scope says otherwise.

## Environment and Toolchain

- Use Node.js LTS with `pnpm` for package management.
- Use the pinned OpenSCAD AppImage in `bin/` for export consistency.
- Keep generated outputs in `out/` (gitignored).

## SCAD Authoring Contract

- For exportable models, prefer `include <../common/common.scad>` (or deeper relative equivalent).
- For reusable libraries, prefer `use <../common/common_use.scad>` (or deeper relative equivalent).
- If extra BOSL2 modules are needed, prefer wrapper includes under `packages/common/`.
- Exportable models should define `module main() { ... }` and call `main();` at EOF.
- Files under module/library surfaces should not emit include-time geometry.
- Avoid top-level `$fn/$fa/$fs` overrides; apply quality overrides locally when needed.
- Units are millimeters and Z is up.

## Validation Commands

- `npm run scad:check`
- `npm run scad:validate`
- `npm run scad:release`
- `npm run scad:inventory`
- Single target validate: `npm run scad:validate -- --id <target>`
- Single target release: `npm run scad:release -- --id <target>`

## Change Boundaries

- Keep edits scoped to the user request; avoid unrelated refactors.
- Do not hand-edit generated outputs under `out/`.
- When changing export targets, update `export.manifest.json` and related docs as needed.

## Definition of Done

- Model or geometry behavior changes: run at least `npm run scad:validate` for affected targets.
- Manifest/export pipeline changes: run `npm run scad:check` and `npm run scad:validate`.
- Release-output-impacting changes: run `npm run scad:release` for impacted targets.
- Inventory/reporting changes: run `npm run scad:inventory`.
- Documentation-only changes: ensure commands and paths are still accurate.

## Nested AGENTS.md Policy

- Nested `AGENTS.md` files may specialize local workflows for their subtree.
- Root non-negotiable constraints in this file remain baseline guardrails across the repo.

## Instruction References

- External guidance:
	- [agents.md](https://agents.md/)
	- [agents.md repository](https://github.com/agentsmd/agents.md)
	- [sessions](.copilot/sessions/)
- Repository instruction files:
	- [copilot](copilot/.github/instructions/copilot.instructions.md)
	- [git](copilot/.github/instructions/git.instructions.md)
	- [node](copilot/.github/instructions/node.instructions.md)
	- [typescript](copilot/.github/instructions/typescript.instructions.md)

## Tool References

- [agent](copilot/.github/instructions/tools/agent.instructions.md)
- [memory](copilot/.github/instructions/tools/memory.instructions.md)
- [principles](copilot/.github/instructions/principles.instructions.md)
- [time](copilot/.github/instructions/time.instructions.md)

## Non-negotiable Constraints

Use the #todo function. Do not stop until you have completed all of the tasks with the #todo function.

Do not modify the git history. Do not checkout or restore any file. Do not commit any changes. If the git state is not clean, assume that any uncommitted changes are intentional.

Ignore the git state of the [copilot](copilot/) directory.
