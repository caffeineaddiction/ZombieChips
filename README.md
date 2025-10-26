# Zombie Apoca-Chips

A Project Zomboid mod that adds craftable potato chips.

## Structure

This mod supports both Build 41 and Build 42:

- `common/media/` - Shared resources (Lua scripts, textures, etc.)
- `42/` - Build 42 metadata (mod.info, poster.png)
- `41/` - Build 41 metadata (mod.info, poster.png)
- `media/` - Root-level media for Build 41 backwards compatibility
- `mod.info` - Root-level mod.info for Build 41 backwards compatibility

## Development

- Add your Lua scripts to `common/media/lua/`
- Add textures to `common/media/textures/`
- Add item scripts to `common/media/scripts/`
- For Build 41 compatibility, also copy to root `media/` folder

## Publishing

Update `workshop.txt` with your Steam Workshop ID before publishing.
