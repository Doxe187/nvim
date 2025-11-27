# My Neovim Configuration

[![Neovim](https://img.shields.io/badge/Neovim-0.9+-green.svg)](https://neovim.io)
[![Lua](https://img.shields.io/badge/Lua-5.1+-blue.svg)](https://www.lua.org/)
[![License](https://img.shields.io/badge/license-MIT-orange.svg)](LICENSE)

## Introduction

This repository hosts my personal Neovim configuration for Linux, macOS, and Windows. The configuration is written entirely in Lua, using [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager. `init.lua` serves as the main entry point.

My configurations are heavily documented to make them as clear as possible. While you can clone the whole repository and use it, it is not recommended. Good configurations are personal - everyone should have their own unique setup. You are encouraged to copy the parts you want and adapt them to your workflow.

**Note:** This configuration is maintained for the latest stable Neovim release. No effort is spent on maintaining backward compatibility.

## Table of Contents

- [Installation and Setup](#installation-and-setup)
- [Architecture](#architecture)
- [Features](#features)
- [Keybindings](#keybindings)
- [Plugin Management](#plugin-management)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)

## Installation and Setup

### Prerequisites

- **Neovim** >= 0.9.0
- **Git** >= 2.0
- **Node.js** and **npm** (for LSP servers)
- A **Nerd Font** (recommended: JetBrains Mono Nerd Font)
- **ripgrep** (for Telescope live grep)
- **fd** (optional, for faster file finding)
- **lazygit** (optional, for git integration)

### Quick Install

```bash
# Backup existing config (if any)
mv ~/.config/nvim ~/.config/nvim.backup

# Clone this repository
git clone https://github.com/YOUR_USERNAME/nvim-config.git ~/.config/nvim

# Start Neovim - lazy.nvim will automatically install plugins
nvim
```

On first launch, lazy.nvim will automatically:
1. Bootstrap itself
2. Install all configured plugins
3. Set up language servers via Mason

### Platform-Specific Notes

**Windows (PowerShell):**
```powershell
# Backup existing config
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.backup

# Clone this repository
git clone https://github.com/YOUR_USERNAME/nvim-config.git $env:LOCALAPPDATA\nvim
```

**macOS:**
```bash
# Install dependencies via Homebrew
brew install neovim ripgrep fd lazygit
```

## Architecture

### Bootstrap Flow

1. **`init.lua`** - Entry point that orchestrates the entire configuration
2. **`lua/core/lazy.lua`** - Auto-installs lazy.nvim if not present
3. **`lua/core/options.lua`** - Sets global Neovim options (tabs, clipboard, etc.)
4. **`lua/core/keymaps.lua`** - Defines all custom keybindings
5. **`require("lazy").setup("plugins")`** - Lazy.nvim automatically loads all plugin specs

### Directory Structure

```
~/.config/nvim/
├── init.lua                 # Main entry point
├── lua/
│   ├── core/
│   │   ├── lazy.lua        # Lazy.nvim bootstrap
│   │   ├── options.lua     # Neovim settings
│   │   └── keymaps.lua     # Keybinding definitions
│   └── plugins/            # Plugin configurations (auto-loaded)
│       ├── autopairs.lua
│       ├── bufferline.lua
│       ├── colorizer.lua
│       ├── colorscheme.lua
│       ├── comment.lua
│       ├── gitsigns.lua
│       ├── indent-blankline.lua
│       ├── lazygit.lua
│       ├── lspconfig.lua
│       ├── lualine.lua
│       ├── mason.lua
│       ├── nvim-cmp.lua
│       ├── nvim-tree.lua
│       ├── spectre.lua
│       ├── surround.lua
│       ├── telescope.lua
│       ├── todo-comments.lua
│       ├── toggleterm.lua
│       ├── treesitter.lua
│       ├── trouble.lua
│       └── which-key.lua
└── README.md
```

### Plugin Organization

Each plugin is defined in its own file under `lua/plugins/` as a Lua table that lazy.nvim consumes. Each file returns a table with:
- Repository URL
- Dependencies
- Configuration function
- Lazy-loading options

## Features

### Core Features

- **Plugin Management** via [lazy.nvim](https://github.com/folke/lazy.nvim) - Fast and modern plugin manager
- **LSP Support** via [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) - Native Language Server Protocol support
- **Auto-completion** via [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) - Powerful completion engine
- **Syntax Highlighting** via [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) - Advanced syntax highlighting

### Plugin Ecosystem

| Category | Plugin | Description |
|----------|--------|-------------|
| **File Explorer** | [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File tree explorer with git integration |
| **Fuzzy Finder** | [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Highly extendable fuzzy finder |
| **Status Line** | [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Blazing fast statusline |
| **Buffer Line** | [bufferline.nvim](https://github.com/akinsho/bufferline.nvim) | Beautiful buffer tabs |
| **Color Scheme** | [embark-theme](https://github.com/embark-theme/vim) | Dark colorscheme inspired by Embark |
| **Git Integration** | [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git decorations and blame |
| **Git UI** | [lazygit.nvim](https://github.com/kdheepak/lazygit.nvim) | Terminal UI for git commands |
| **LSP Installer** | [mason.nvim](https://github.com/williamboman/mason.nvim) | Portable package manager for LSP servers |
| **Auto Pairs** | [nvim-autopairs](https://github.com/windwp/nvim-autopairs) | Automatic bracket pairing |
| **Surround** | [nvim-surround](https://github.com/kylechui/nvim-surround) | Add/change/delete surrounding delimiters |
| **Commenting** | [Comment.nvim](https://github.com/numToStr/Comment.nvim) | Smart commenting |
| **Terminal** | [toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim) | Persistent terminal windows |
| **Diagnostics** | [trouble.nvim](https://github.com/folke/trouble.nvim) | Pretty list for diagnostics |
| **TODO Comments** | [todo-comments.nvim](https://github.com/folke/todo-comments.nvim) | Highlight and search TODO comments |
| **Which Key** | [which-key.nvim](https://github.com/folke/which-key.nvim) | Display keybindings in popup |
| **Search/Replace** | [nvim-spectre](https://github.com/nvim-pack/nvim-spectre) | Project-wide search and replace |
| **Indent Guides** | [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim) | Indentation guides |
| **Color Highlighter** | [nvim-colorizer.lua](https://github.com/norcalli/nvim-colorizer.lua) | Color code highlighter |

### Language Support

**Treesitter parsers auto-installed for:**
- Lua, Vim, Vimdoc
- Python, JavaScript, TypeScript, TSX
- HTML, CSS, JSON, YAML, TOML
- Bash, Markdown
- C, C++, Rust, Go
- Regex, Comments

**LSP servers can be installed via Mason:**
- `lua_ls` (Lua)
- `pyright` (Python)
- `ts_ls` (TypeScript/JavaScript)
- `rust_analyzer` (Rust)
- `gopls` (Go)
- And many more...

## Keybindings

**Leader Key:** `<Space>`

### General

| Shortcut | Mode | Description |
|----------|------|-------------|
| `<leader>w` | Normal | Save current file |
| `<leader>q` | Normal | Quit current window |
| `<leader>bd` | Normal | Close current buffer |

### Window Navigation

| Shortcut | Mode | Description |
|----------|------|-------------|
| `<C-h>` | Normal | Move to left window |
| `<C-j>` | Normal | Move to bottom window |
| `<C-k>` | Normal | Move to top window |
| `<C-l>` | Normal | Move to right window |

### Window Resizing

| Shortcut | Mode | Description |
|----------|------|-------------|
| `<C-Up>` | Normal | Increase window height |
| `<C-Down>` | Normal | Decrease window height |
| `<C-Left>` | Normal | Decrease window width |
| `<C-Right>` | Normal | Increase window width |

### Buffer Navigation

| Shortcut | Mode | Description |
|----------|------|-------------|
| `<Tab>` | Normal | Next buffer |
| `<S-Tab>` | Normal | Previous buffer |
| `<leader>bd` | Normal | Close current buffer |

### File Explorer (nvim-tree)

| Shortcut | Mode | Description |
|----------|------|-------------|
| `<leader>n` | Normal | Toggle file explorer |
| `<leader>e` | Normal | Focus file explorer |

### Telescope (Fuzzy Finder)

| Shortcut | Mode | Description |
|----------|------|-------------|
| `<leader>ff` | Normal | Find files |
| `<leader><leader>` | Normal | Live grep (search text) |
| `<leader>fh` | Normal | Search help tags |
| `<leader>fr` | Normal | Recent files |
| `<leader>fc` | Normal | Find word under cursor |

### Visual Mode Enhancements

| Shortcut | Mode | Description |
|----------|------|-------------|
| `J` | Visual | Move selected lines down |
| `K` | Visual | Move selected lines up |
| `<` | Visual | Indent left (stay in visual) |
| `>` | Visual | Indent right (stay in visual) |
| `p` | Visual | Paste without overwriting register |

### Centered Navigation

| Shortcut | Mode | Description |
|----------|------|-------------|
| `<C-d>` | Normal | Half page down (centered) |
| `<C-u>` | Normal | Half page up (centered) |
| `n` | Normal | Next search result (centered) |
| `N` | Normal | Previous search result (centered) |

## Plugin Management

### Installing New Plugins

1. Create a new file in `lua/plugins/` (e.g., `lua/plugins/new-plugin.lua`)
2. Return a lazy.nvim plugin spec:

```lua
return {
  "author/plugin-name",
  config = function()
    require("plugin-name").setup({
      -- your configuration
    })
  end,
}
```

3. Restart Neovim - lazy.nvim will auto-discover and install it

### Managing Plugins

Run these commands from within Neovim:

```vim
:Lazy              " Open lazy.nvim UI
:Lazy sync         " Update all plugins
:Lazy clean        " Remove unused plugins
:Lazy restore      " Restore to lockfile state
```

### LSP Management

Install language servers via Mason:

```vim
:Mason             " Open Mason UI
:MasonInstall lua_ls pyright  " Install specific servers
:LspInfo           " Check LSP status for current buffer
```

## Customization

### Changing Options

Edit `lua/core/options.lua` to modify Neovim settings:

```lua
vim.opt.tabstop = 2        -- Tab width
vim.opt.shiftwidth = 2     -- Indent width
vim.opt.number = true      -- Show line numbers
-- etc.
```

### Adding Keybindings

Edit `lua/core/keymaps.lua`:

```lua
vim.keymap.set("n", "<leader>x", ":YourCommand<CR>", { desc = "Description" })
```

### Changing Colorscheme

Edit `lua/plugins/colorscheme.lua` and replace the plugin:

```lua
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd.colorscheme("catppuccin")
  end,
}
```

## Troubleshooting

### Check Health

Neovim includes a built-in health checker:

```vim
:checkhealth
```

This will diagnose common issues with plugins, LSP, and dependencies.

### Reload Configuration

After making changes:

```vim
:source $MYVIMRC
```

Or restart Neovim.

### Common Issues

**Plugins not loading:**
```vim
:Lazy sync
```

**LSP not working:**
```vim
:LspInfo          " Check if LSP is attached
:Mason            " Verify server is installed
```

**Treesitter highlighting broken:**
```vim
:TSUpdate         " Update parsers
:TSInstall <language>  " Install specific parser
```

**Telescope not finding files:**
- Install `ripgrep` and `fd` via your package manager
- Check that you're in a valid project directory

### Clean Install

If something goes wrong:

```bash
# Backup your config
mv ~/.config/nvim ~/.config/nvim.backup

# Remove plugin data
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

# Restore config and restart
mv ~/.config/nvim.backup ~/.config/nvim
nvim
```

## Testing Configuration

### Headless Test

Test if configuration loads without errors:

```bash
nvim --headless -c "lua print('Config loaded successfully')" -c "qall"
```

### Startup Time

Check startup performance:

```bash
nvim --startuptime startup.log
```

## Screenshots

> *Add screenshots of your configuration here!*

- File explorer with nvim-tree
- Telescope fuzzy finding
- LSP autocompletion
- Git integration with gitsigns
- Terminal with toggleterm

## Contributing

This is a personal configuration, but feel free to:
- Open issues for bugs or questions
- Submit PRs for improvements
- Fork and adapt to your needs

## License

This configuration is available under the MIT License. See `LICENSE` file for details.

## Further Reading

**Resources:**
- [Neovim Documentation](https://neovim.io/doc/)
- [lazy.nvim Documentation](https://lazy.folke.io/)
- [LSP Configuration Guide](https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md)

**My Notes:**
- Add your blog posts or documentation here
- Learning resources you found helpful
- Migration guides from other editors

---

**Enjoy your Neovim journey!**
