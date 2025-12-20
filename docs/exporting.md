# Exporting

This repo exports models using the pinned OpenSCAD AppImage.

## Manifest

- Manifest: `export.manifest.json`
- Outputs: `out/` (ignored by git)

Minimal example:

```json
{
  "version": 1,
  "outputsDir": "out",
  "targets": [
    {
      "id": "tray-coffee",
      "path": "packages/tray/coffee.scad",
      "formats": ["png", "stl"]
    }
  ],
  "checks": {
    "includeNoGeometry": ["packages/modules/modules.scad"]
  }
}
```

## Commands

- Validate (PNGs only): `npm run scad:validate`
- Release (STL + PNG): `npm run scad:release`
- Library checks (include-time geometry): `npm run scad:check`
- Inventory snapshot: `npm run scad:inventory`

Run a single target:

- `npm run scad:validate -- --id tray-coffee`
- `npm run scad:release -- --id tray-coffee`

## Notes

- The exporter sets `APPIMAGE_EXTRACT_AND_RUN=1` for FUSE-less environments.
- Warnings and errors are treated as failures.
- Output layout is `out/<mode>/<targetId>/` where `<mode>` is `validate` or `release`.
