# Project Zomboid Modding: Build 41 vs Build 42

## Overview

Project Zomboid Build 42 introduced significant changes to the mod folder structure and packaging system. The key difference is that Build 42 uses a versioned folder approach that allows mods to support multiple game builds simultaneously.

**Important**: Build 41 saves and mods are NOT compatible with Build 42. However, a single mod package can support BOTH builds using the new folder structure.

---

## Build 41 Structure (Legacy)

Build 41 uses a flat structure where the root directory of the mod contains all files:

```
YourMod/
├── media/
│   ├── lua/
│   │   └── client/
│   │       └── YourCode.lua
│   ├── scripts/
│   ├── textures/
│   └── models_x/
├── mod.info
├── poster.png
└── icon.png
```

### Key Characteristics
- All content lives in the `media/` folder at the root level
- `mod.info` and `poster.png` are in the root directory
- Simple, flat structure
- The game loads files directly from the root of the mod folder

---

## Build 42 Structure (Current)

Build 42 requires a versioned folder structure with a mandatory `common/` folder:

```
YourMod/
├── common/              # Mandatory - mod won't be detected without it
│   └── media/
│       ├── lua/
│       │   └── client/
│       │       └── YourCode.lua
│       ├── scripts/
│       ├── textures/
│       └── models_x/
├── 42/                  # Build 42 specific files
│   ├── mod.info
│   ├── poster.png
│   └── icon.png
└── 41/                  # Build 41 support (optional)
    ├── mod.info
    ├── poster.png
    └── icon.png
```

### Key Characteristics
- **`common/` folder is MANDATORY** - the mod will not be detected without it
- `media/` folder moves inside `common/`
- Version-specific folders (41/, 42/) contain metadata files only
- The game queries the mod for the subdirectory containing the most recent compatible version
- **Build 42 cannot load Build 41 mod files** until the workshop item has been updated with a `42/` directory

---

## Cross-Build Compatibility (Supporting Both Builds)

To support both Build 41 and Build 42 simultaneously, use this structure:

```
YourMod/
├── common/              # Shared resources for all versions
│   └── media/
│       └── lua/
│           └── ... (your shared code)
├── 42/                  # Build 42 metadata
│   ├── mod.info
│   └── poster.png
├── 41/                  # Build 41 metadata (optional but recommended)
│   ├── mod.info
│   └── poster.png
├── media/               # Root-level media for backwards compatibility
│   └── lua/
│       └── ... (same content as common/media)
├── mod.info            # Root-level mod.info for backwards compatibility
└── poster.png          # Root-level poster for backwards compatibility
```

### Migration Steps

To update an existing Build 41 mod to support Build 42:

1. **Create two new folders** in your mod's root directory:
   - `42/` (for Build 42 specific files)
   - `common/` (for shared resources)

2. **Copy (don't move)** the following to the `42/` folder:
   - `mod.info`
   - `poster.png`
   - `icon.png` (if present)

3. **Copy your entire `media/` folder** into the `common/` folder:
   - So you have: `common/media/lua/...`

4. **Keep original files in place** for Build 41 compatibility:
   - Keep root-level `mod.info`, `poster.png`, and `media/` folder

5. **(Optional) Create a `41/` folder** with Build 41 metadata if you want cleaner organization

---

## Workshop Folder Structure

When publishing to Steam Workshop, use this complete structure:

```
YourMod/
├── Contents/
│   └── mods/
│       └── YourMod/
│           ├── common/
│           │   └── media/
│           │       └── ... (your content)
│           ├── 42/
│           │   ├── mod.info
│           │   └── poster.png
│           └── 41/
│               ├── mod.info
│               └── poster.png
├── preview.png          # Workshop preview image
└── workshop.txt         # Workshop configuration
```

### Workshop Installation Paths

- **Windows**: `C:/Users/YourUsername/Zomboid/Workshop/`
- **Linux**: `~/.zomboid/Workshop/`

---

## Essential Files

### mod.info

Located in version-specific folders (41/, 42/). Contains mod metadata:

```
name=Your Mod Name
id=YourModID
description=Your mod description
poster=poster.png
```

### workshop.txt

Located at the root of your workshop item:

```
version=1
id=yourWorkshopID
title=Your Mod Title
description=Your mod description
visibility=public
```

### poster.png

- Mod thumbnail/poster image
- Located in version-specific folders (41/, 42/)
- Also at root level for backwards compatibility

### icon.png

- Optional mod icon
- Located in version-specific folders if used

---

## Best Practices for Cross-Build Development

1. **Store shared code in `common/`**
   - Place all Lua scripts, textures, models, and other assets in `common/media/`
   - Avoid duplicating code between builds

2. **Use version-specific folders for metadata only**
   - Keep `mod.info`, `poster.png`, and other metadata in 41/ and 42/ folders
   - This allows different descriptions or requirements per build

3. **Maintain backwards compatibility**
   - Keep root-level files for Build 41 users
   - Don't remove the old structure until Build 41 support is no longer needed

4. **Test both builds separately**
   - Verify the mod loads correctly in both Build 41 and Build 42
   - Check that shared resources work properly in both versions

5. **The `common/` folder is MANDATORY for Build 42**
   - Even if empty, the folder must exist
   - Build 42 will not detect the mod without it

---

## Common Folder Structure Inside `media/`

Typical subdirectories within `common/media/` or `media/`:

```
media/
├── lua/              # Lua scripts
│   ├── client/       # Client-side code
│   ├── server/       # Server-side code
│   └── shared/       # Shared code
├── scripts/          # Item/recipe definitions
├── textures/         # Texture files
├── models_x/         # 3D models
├── clothing/         # Clothing definitions
└── sound/            # Audio files
```

---

## Key Differences Summary

| Aspect | Build 41 | Build 42 |
|--------|----------|----------|
| Root structure | Flat, everything at root | Versioned folders (41/, 42/, common/) |
| `media/` location | Root level | Inside `common/` |
| `mod.info` location | Root level | Inside version folders (41/, 42/) |
| `common/` folder | Not used | **Mandatory** |
| Cross-version support | Not designed for it | Built-in through folder structure |
| Backwards compatibility | N/A | Possible by keeping root-level files |

---

## Notes

- **API changes between builds are significant** but are not covered in this document (as per requirements)
- The folder structure changes are primarily for packaging and deployment
- The actual code organization within `media/` remains similar between builds
- Steam Workshop tags can help users find Build 42 compatible mods
