# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a **LazyVim-based Neovim configuration** that uses lazy.nvim for plugin management. LazyVim provides a modern, opinionated foundation with sensible defaults while allowing extensive customization.

### Core Structure
- `init.lua` - Entry point that bootstraps LazyVim
- `lua/config/` - Core configuration (keymaps, options, autocmds)
- `lua/plugins/` - Individual plugin specifications (one file per plugin/group)
- `lazy-lock.json` - Plugin version lockfile (currently 36 plugins)
- `lazyvim.json` - LazyVim metadata and configuration

## Plugin Management

### Common Commands
- `:Lazy` - Open plugin manager UI for updates, installation, profiling
- `:Lazy sync` - Synchronize with lockfile versions
- `:Lazy update` - Update all plugins to latest versions
- `:LazyVim` - Access LazyVim-specific utilities and commands

### Plugin Configuration Pattern
Each plugin file in `lua/plugins/` returns a table with lazy.nvim specifications:

```lua
return {
  {
    "plugin/name",
    opts = { ... },           -- Plugin options
    keys = { ... },           -- Key mappings for lazy loading
    ft = "filetype",          -- Load on specific file types
    event = "BufRead",        -- Load on Neovim events
    dependencies = { ... },   -- Plugin dependencies
  },
}
```

### Adding/Modifying Plugins
1. Create new file in `lua/plugins/` (e.g., `myplug.lua`)
2. Return plugin specification table
3. LazyVim will automatically detect and load the plugin
4. Use `opts` functions for complex configuration merging with LazyVim defaults

## Configuration Conventions

### Lazy Loading Strategy
- Plugins load on-demand for optimal startup performance
- Use `keys`, `ft`, `event`, or `cmd` for lazy loading triggers
- Example: `keys = { "<leader>f" }` loads plugin only when key is pressed

### Override LazyVim Defaults
To modify LazyVim's built-in plugin configurations:
1. Create plugin file with same plugin name
2. Provide new `opts` table or function
3. LazyVim will merge/override the configuration

### File Organization
- `lua/config/keymaps.lua` - Custom key mappings
- `lua/config/options.lua` - Neovim option overrides  
- `lua/config/autocmds.lua` - Custom auto-commands
- Individual plugin files should be focused and single-purpose

## Current Specialized Configurations

### Obsidian Integration
- Workspace: "juanvault" in iCloud directory
- Custom completion and checkbox handling
- Smart action keybindings

### Development Tools
- Mason.nvim for LSP server management
- Conform.nvim for code formatting (uses StyLua config)
- Blink.cmp for completion engine
- Treesitter for syntax highlighting

### Code Formatting
- StyLua configuration: 2-space indentation, 120-column width
- Format files: `stylua --config-path stylua.toml <files>`

## Key Architectural Decisions

1. **LazyVim Foundation**: Provides curated defaults while maintaining customization flexibility
2. **Modular Plugin Files**: Each plugin/feature gets its own configuration file
3. **Lazy Loading**: Optimized startup through strategic plugin loading
4. **Version Locking**: Reproducible environments via lazy-lock.json
5. **Convention Over Configuration**: Follow LazyVim patterns for consistency

## Debugging and Troubleshooting

### Viewing Startup Messages
- `:messages` - View recent error/warning messages
- `:Lazy profile` - Analyze plugin loading performance
- `nvim --startuptime startup.log` - Generate detailed startup timing

### Plugin Issues
- `:Lazy health` - Check plugin health status
- `:checkhealth` - Run comprehensive health checks
- Review plugin specifications in `lua/plugins/` for configuration errors