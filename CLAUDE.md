# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal Neovim configuration written in Lua, using lazy.nvim as the plugin manager. The configuration is modular with separate files for core settings, keymaps, and individual plugin configurations.

## Architecture

**Bootstrap Flow:**
1. `init.lua` - Entry point that loads the lazy.nvim bootstrap, core modules, and plugin setup
2. `lua/core/lazy.lua` - Auto-installs lazy.nvim if not present
3. `lua/core/options.lua` - Sets global Neovim options
4. `lua/core/keymaps.lua` - Defines all custom keybindings
5. `require("lazy").setup("plugins")` - Lazy.nvim automatically loads all plugin specs from `lua/plugins/`

**Plugin Organization:**
Each plugin is defined in its own file under `lua/plugins/` as a Lua table that lazy.nvim consumes. Each file returns a table with plugin spec including repository, dependencies, and config function.

## Key Configuration Details

**Leader Key:** Space (`<Space>`)

**Core Plugins:**
- nvim-tree.lua - File explorer (toggle: `<leader>n`)
- telescope.nvim - Fuzzy finder (find files: `<leader>ff`, grep: `<leader>fg`)
- nvim-treesitter - Syntax highlighting (auto-installs parsers for: lua, vim, vimdoc, python, javascript, typescript)
- lualine.nvim - Statusline
- tokyonight.nvim - Colorscheme

**Keybinding Conventions:**
- `<leader>` prefix for main commands (file save, quit, telescope, nvim-tree)
- `<C-h/j/k/l>` for window navigation
- `<C-arrows>` for window resizing
- `<Tab>/<S-Tab>` for buffer navigation
- Telescope uses `<C-j/k>` for selection navigation in insert mode

**Important Settings:**
- Tab width: 2 spaces (expandtab enabled)
- Clipboard: integrated with system clipboard ("unnamedplus")
- netrw is disabled (required for nvim-tree)
- Undo persistence enabled, no backup/swap files
- Case-insensitive search with smart case

## Testing Changes

Since this is a Neovim configuration, testing requires Neovim itself:

**Reload configuration:**
```bash
# From within Neovim
:source $MYVIMRC
# Or restart Neovim
```

**Check for errors:**
```bash
nvim --headless -c "lua print('Config loaded')" -c "qall"
```

**Plugin management:**
```bash
# From within Neovim
:Lazy sync          # Update all plugins
:Lazy restore       # Restore plugins to lockfile state
:checkhealth        # Diagnose configuration issues
```

## Modifying Configuration

**Adding a new plugin:**
1. Create new file in `lua/plugins/` (e.g., `lua/plugins/new-plugin.lua`)
2. Return a lazy.nvim plugin spec table
3. Restart Neovim - lazy.nvim auto-discovers new files

**Adding keybindings:**
Edit `lua/core/keymaps.lua` and use `vim.keymap.set()` with descriptive `desc` field

**Changing options:**
Edit `lua/core/options.lua` using `vim.opt` or `vim.g` APIs
