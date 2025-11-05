return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  config = function()
    local wk = require("which-key")
    wk.setup({
      plugins = {
        marks = true,
        registers = true,
        spelling = {
          enabled = true,
          suggestions = 20,
        },
        presets = {
          operators = true,
          motions = true,
          text_objects = true,
          windows = true,
          nav = true,
          z = true,
          g = true,
        },
      },
      win = {
        border = "rounded",
        position = "bottom",
      },
    })

    -- Gruppe-Registrierungen für bessere Beschreibungen
    wk.add({
      { "<leader>f", group = "Find (Telescope)" },
      { "<leader>h", group = "Git Hunks" },
      { "<leader>x", group = "Trouble/Diagnostics" },
      { "<leader>c", group = "Code" },
      { "<leader>r", group = "Rename" },
      { "<leader>g", group = "Git" },
    })
  end,
}
