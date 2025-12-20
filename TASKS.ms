# Repo Improvements (OpenSCAD/BOSL2 + Node tooling)

1. [ ] Clarify repo boundaries and make “Copilot integration” optional (organization)
   1. [ ] Add a single developer onboarding page under `docs/` that separates:
      1. [ ] “Model authoring + exporting” essentials (pinned OpenSCAD AppImage, export commands, required env vars)
      2. [ ] “Copilot/agents workflow” optional setup (what it is, when you need it, where sessions live)
      3. [ ] Update the root README to link to the onboarding page
   2. [ ] Document the symlink/overlay behavior driven by `link.json`
      1. [ ] Document which paths are symlinked/generated (e.g., `.github/agents/_`, `.vscode/_`) and should not be hand-edited
      2. [ ] Document how to refresh/regenerate the overlay, plus common failure modes (missing targets, broken symlinks)
   3. [ ] Add a lightweight contributor “doctor” command (no behavior changes)
      1. [ ] Verify the pinned OpenSCAD AppImage exists and is executable (and print `APPIMAGE_EXTRACT_AND_RUN=1` guidance if needed)
      2. [ ] Verify required overlay targets exist (report missing paths referenced by `link.json`)
      3. [ ] Verify Node runtime compatibility for scripts (print Node version + guidance)
      4. [ ] Wire it as `npm run scad:doctor` implemented by `scripts/scad-doctor.mjs`
   4. [ ] Define a `.copilot/sessions/` retention/index policy
      1. [ ] Add a short README describing what belongs in sessions and how to prune/archive old ones
      2. [ ] (Optional) Add a script to generate an index of recent sessions for discoverability

2. [ ] Standardize `packages/*` conventions and enforce the SCAD package contract (structure)
   1. [ ] Choose a single BOSL2 source-of-truth and remove ambiguity
      1. [ ] Decide whether `lib/BOSL2/` is the only supported location (recommended by current docs)
      2. [ ] Update `.gitmodules`, docs, and any include guidance to match the decision
   2. [ ] Create a reusable package template and document the contract
      1. [ ] Add `packages/_template/` (or equivalent) with:
         1. [ ] Standard common include pattern (`include <../common/common.scad>`)
         2. [ ] `module main() { ... }` entrypoint and `main();` call
         3. [ ] Parameter naming/default pattern and a minimal example geometry
      2. [ ] Add a short “New package checklist” referencing `docs/scad-contract.md`
   3. [ ] Turn the inventory into actionable contract checks (warnings → gates)
      1. [ ] Extend inventory/check tooling to emit per-file violations (not just aggregate counts)
      2. [ ] Add a “contract check” mode that fails on newly-added/modified files only
      3. [ ] Add an allowlist/waiver mechanism for legacy exceptions (with expiry or rationale)
      4. [ ] Wire the contract check into `npm run scad:check` and/or `npm run scad:validate`
   4. [ ] Reduce include-time side effects and import drift
      1. [ ] Add a rule: libraries should be side-effect-free; packages should use a `main()` entrypoint
      2. [ ] Add checks for common contract breaks (top-level geometry, legacy direct BOSL2 includes)

3. [ ] Consolidate export + inventory tooling into a single CLI and reduce duplication (technical debt)
   1. [ ] Extract shared helpers used by existing scripts
      1. [ ] Centralize JSON parsing + schema validation for `export.manifest.json`
      2. [ ] Centralize file discovery/walking and reporting utilities
      3. [ ] Centralize OpenSCAD invocation (AppImage path, `APPIMAGE_EXTRACT_AND_RUN=1`, args)
      4. [ ] Place helpers under a stable module path (e.g., `scripts/lib/*`) and import from there
   2. [ ] Introduce one user-facing CLI entrypoint (keep current scripts as thin shims)
      1. [ ] Add a `scripts/scad.*` command with subcommands (e.g., `check`, `validate`, `release`, `inventory`)
      2. [ ] Update `package.json` scripts to call the unified entrypoint
      3. [ ] Keep backwards-compatible behavior by delegating from old scripts (until removed)
   3. [ ] Make manifest management discoverable and safer
      1. [ ] Add a command to validate and pretty-print the manifest with clear errors
      2. [ ] Add a command to list known targets and their source paths
      3. [ ] Define a policy for manifest coverage (curated release set vs expanded coverage)
   4. [ ] Update docs so the workflow is obvious end-to-end
      1. [ ] Document: add/modify model → contract check → export → validate → update inventory
      2. [ ] Add examples for exporting STL/PNG using the pinned AppImage
