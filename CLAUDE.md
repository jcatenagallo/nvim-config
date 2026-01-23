# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

LazyVim-based Neovim configuration using lazy.nvim for plugin management.

### Core Structure
- `init.lua` - Entry point (bootstraps via `require("config.lazy")`)
- `lua/config/lazy.lua` - Plugin manager setup and LazyVim imports
- `lua/config/keymaps.lua` - Custom key mappings
- `lua/config/options.lua` - Neovim option overrides (currently empty)
- `lua/config/autocmds.lua` - Custom auto-commands (currently empty)
- `lua/plugins/` - Individual plugin specifications (modular approach)

### Enabled LazyVim Extras
LazyVim extras are imported in `lua/config/lazy.lua:24-25`:
- `lazyvim.plugins.extras.linting.eslint`
- `lazyvim.plugins.extras.formatting.prettier`

Note: `lazyvim.json` shows extras array is empty, indicating extras are managed via explicit imports in lazy.lua rather than through the LazyVim UI.

## Commands

### Plugin Management
- `:Lazy` - Plugin manager UI
- `:Lazy sync` - Synchronize with lockfile
- `:Lazy update` - Update all plugins
- `:Lazy profile` - Analyze loading performance

### Code Formatting
```bash
stylua --config-path stylua.toml <files>
```
Config: 2-space indentation, 120-column width

### Debugging
- `:messages` - View error/warning messages
- `:checkhealth` - Comprehensive health checks
- `nvim --startuptime startup.log` - Startup timing

## Plugin Configuration Pattern

```lua
return {
  {
    "plugin/name",
    opts = { ... },           -- Plugin options
    keys = { ... },           -- Lazy load triggers
    ft = "filetype",          -- Load on file types
    event = "BufRead",        -- Load on events
  },
}
```

To override LazyVim defaults: create plugin file with same name and provide `opts` table/function.

## Key Custom Configurations

### Harpoon (Quick File Navigation)
Using harpoon2 branch with custom keybindings (`lua/plugins/harpoon.lua`):
- `<leader>H` - Add current file to Harpoon list
- `<leader>h` - Toggle Harpoon quick menu
- `<leader>hd` - Remove current file from Harpoon
- `<leader>hc` - Clear all Harpoon files
- `<leader>1-5` - Jump to files 1-5
- `<leader>j/k/l/;` - Quick access to positions 1-4

### Split Navigation
Custom keybindings in `lua/config/keymaps.lua:26-29`:
- `qj/qk/ql/q;` - Navigate left/down/up/right splits

### File Path Operations
Custom keybindings in `lua/config/keymaps.lua:20-23`:
- `<leader>fy` - Copy relative file path to clipboard

### Navigation
- `<leader>hh` - Jump to previous cursor position (uses jump list)

### Miscellaneous Keybindings
- `<leader>o` - Focus file explorer (left window)
- `jj` - Alternative escape in insert mode
- `;;` - Trigger LSP autocompletion in insert mode

### Obsidian Integration
Configuration in `lua/plugins/obsidian.lua`:
- Workspace: "juanvault" in iCloud (`~/Library/Mobile Documents/iCloud~md~obsidian/Documents/juanvault/`)
- Integrated with blink.cmp for completion
- Keybindings (active only in Obsidian markdown files):
  - `gf` - Follow link under cursor
  - `<leader>ot` - Open today's note
  - `<leader>of` - Create new note
  - `<leader>ox` - Toggle checkbox

### Snacks.nvim Picker
Configuration in `lua/plugins/snacks.lua`:
- Shows hidden files (`hidden: true`)
- Shows gitignored files (`ignored: true`)

### Completion (blink.cmp)
Configuration in `lua/plugins/blink.lua`:
- Uses Rust-based blink.cmp with "default" keymap preset
- `<C-y>` to accept completion
- `<Enter>` also accepts completion (custom override)
- `<C-space>` to open menu or docs
- `<C-n>/<C-p>` or `Up/Down` to navigate
- `<C-e>` to hide menu
- Documentation popup is manual (not auto-shown)
- Sources: LSP, path, snippets, buffer
- Fuzzy matching with Rust implementation

### Zen Mode
Installed (`lua/plugins/zen-mode.lua`) with default configuration.

## Key Architectural Decisions

1. **Modular Plugin Files** - Each plugin in separate file in `lua/plugins/`
2. **Version Locking** - `lazy-lock.json` for reproducible environments
3. **Lazy Loading** - Plugins load on-demand via keys/ft/event/cmd (though defaults.lazy=false for custom plugins)
4. **Blink.cmp** - Modern Rust-based completion over nvim-cmp
5. **Harpoon2** - Using version 2 branch for file navigation
6. **Explicit Extra Imports** - LazyVim extras imported directly in lazy.lua rather than managed through lazyvim.json
