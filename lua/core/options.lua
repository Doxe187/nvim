-- Basis-Einstellungen für Neovim
local opt = vim.opt
local g = vim.g

-- Zeilennummern
opt.number = true
opt.relativenumber = false

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- Suche
opt.ignorecase = true
opt.smartcase = true

-- Aussehen
opt.termguicolors = true
opt.signcolumn = "yes"
opt.cursorline = true

-- Verhalten
opt.clipboard = "unnamedplus"
opt.mouse = "a"
opt.undofile = true
opt.backup = false
opt.swapfile = false

-- Splits
opt.splitright = true
opt.splitbelow = true

-- netrw deaktivieren (wichtig für nvim-tree)
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
