# TODO: Update Icons for Potato Chips

This document explains how to create and add custom icons for the Raw and Cooked Potato Chips items.

---

## Image Specifications

### Dimensions and Format
- **Format**: PNG with transparency (RGBA)
- **Dimensions**: 64x64 pixels (standard for inventory icons)
- **Alternative**: 128x128 pixels (will be scaled down)
- **Color Depth**: 32-bit (RGBA)
- **Transparency**: Yes (alpha channel supported)

### Recommended Design
- Keep the design simple and clear at small sizes
- Use transparency for non-rectangular items
- Follow the art style of existing Project Zomboid items
- Ensure good contrast for visibility

---

## File Locations

Create your icon files and place them in BOTH locations for cross-build compatibility:

### Build 42 Location:
```
common/media/textures/
├── RawPotatoChips.png      # Icon for raw chips
├── CookedPotatoChips.png   # Icon for cooked chips
└── ZombieApocaChips.png    # Icon for packaged chips (optional)
```

### Build 41 Location (copy the same files):
```
media/textures/
├── RawPotatoChips.png
├── CookedPotatoChips.png
└── ZombieApocaChips.png
```

---

## Updating Configuration Files

### Current Configuration

**File**: `common/media/scripts/items.txt` (and `media/scripts/items.txt`)

Currently using vanilla game icons:
- `RawPotatoChips` → Icon = `Crisps`
- `CookedPotatoChips` → Icon = `Crisps2`
- `ZombieApocaChips` → Icon = `Crisps3`

### How to Reference Custom Icons

Update the `Icon` property in both files:
- `common/media/scripts/items.txt`
- `media/scripts/items.txt`

**Before:**
```
item RawPotatoChips
{
    Type = Food,
    DisplayName = Raw Potato Chips,
    Icon = Crisps,
    ...
}
```

**After:**
```
item RawPotatoChips
{
    Type = Food,
    DisplayName = Raw Potato Chips,
    Icon = RawPotatoChips,  // References RawPotatoChips.png
    ...
}
```

### Full Updates Needed

1. **RawPotatoChips**:
   - Change: `Icon = Crisps,`
   - To: `Icon = RawPotatoChips,`

2. **CookedPotatoChips**:
   - Change: `Icon = Crisps2,`
   - To: `Icon = CookedPotatoChips,`

3. **ZombieApocaChips** (optional - if you want custom branding):
   - Change: `Icon = Crisps3,`
   - To: `Icon = ZombieApocaChips,`

---

## Step-by-Step Process

### 1. Create Icon Images
- Create 3 PNG files (64x64 or 128x128 pixels)
- Name them exactly as shown above
- Use transparency for better visual quality

### 2. Place Files in Texture Folders
```bash
# Place in Build 42 location
cp RawPotatoChips.png common/media/textures/
cp CookedPotatoChips.png common/media/textures/
cp ZombieApocaChips.png common/media/textures/

# Place in Build 41 location
cp RawPotatoChips.png media/textures/
cp CookedPotatoChips.png media/textures/
cp ZombieApocaChips.png media/textures/
```

### 3. Update Item Definitions

Edit both files:
- `common/media/scripts/items.txt`
- `media/scripts/items.txt`

Update the Icon values as shown above (without .png extension).

---

## Important Notes

- **No file extension**: When referencing icons in scripts, do NOT include `.png`
- **Case sensitive**: Icon names are case-sensitive on Linux systems
- **Both locations required**: Place files in both `common/media/textures/` and `media/textures/` for cross-build compatibility
- **Update both script files**: Changes must be made to both `common/media/scripts/items.txt` AND `media/scripts/items.txt`

---

## Testing

After adding icons:
1. Launch Project Zomboid
2. Enable the mod
3. Check inventory to see if custom icons appear
4. If icons don't appear, check:
   - File names match exactly (case-sensitive)
   - PNG files are in correct folders
   - No .png extension in Icon property
   - Files are valid PNG format

---

## Fallback Behavior

If custom icons are not found, the game will:
- Show a default "missing texture" icon
- Log an error in the console
- The mod will still function, just with placeholder icons

---

## Example Icon Creation Tools

- **GIMP**: Free, cross-platform image editor
- **Aseprite**: Excellent for pixel art
- **Photoshop**: Professional tool
- **Paint.NET**: Free Windows tool
- **Krita**: Free digital painting tool

---

## Current Vanilla Icon References

If you want to keep using vanilla icons for some items:

Common chip/snack icons in Project Zomboid:
- `Crisps` - Regular chips bag
- `Crisps2` - Alternative chips bag
- `Crisps3` - Another chips variant
- `Crisps4` - Yet another variant

You can mix custom and vanilla icons as needed.
