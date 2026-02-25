-- ~/.config/nvim/lua/plugins/render_markdown.lua
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",   -- Pflicht
      "nvim-mini/mini.nvim",               -- Optional, wenn du mini-icons etc. nutzt
      -- oder stattdessen:
      -- "nvim-mini/mini.icons",
      -- "nvim-tree/nvim-web-devicons"
    },
    opts = {
      -- LaTeX Support deaktivieren (Parser/Tools nicht installiert)
      latex = {
        enabled = false,
      },
    },
  },
}

