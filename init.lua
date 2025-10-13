-- >>> Basis-Settings
vim.g.mapleader = " "
vim.o.clipboard = "unnamedplus"
vim.o.termguicolors = true

-- netrw deaktivieren (wichtig für nvim-tree)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- >>> Lazy.nvim auto-install
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- >>> Plugins laden
require("lazy").setup({
  -- Farben
  { "folke/tokyonight.nvim", lazy = false, priority = 1000 },

  -- Icons für nvim-tree
  { "nvim-tree/nvim-web-devicons" },

  -- Datei-Explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end
  },

  -- Statusleiste
  { "nvim-lualine/lualine.nvim", config = function()
      require("lualine").setup()
    end
  },

  -- Fuzzy Finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end
  },

  -- Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = { enable = true },
        indent = { enable = true },
      })
    end
  },
})

-- >>> Farben aktivieren
vim.cmd.colorscheme("tokyonight")

-- >>> Keymaps
vim.keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { desc = "Find files" })
vim.keymap.set("n", "<leader>f", ":Telescope live_grep<CR>", { desc = "Grep text" })

