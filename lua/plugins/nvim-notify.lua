-- You can add your own plugins here or in other files in this directory!
-- I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      local notify = require("notify")
      notify.setup({
        background_colour = "#000000",
        fps = 30,
        level = 2,
        minimum_width = 50,
        render = "default",
        stages = "fade_in_slide_out",
        timeout = 3000,
        top_down = true,
      })
      -- nvim-notify als Standard-Notify setzen
      vim.notify = notify
    end,
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        -- Override markdown rendering damit LSP hover messages korrekt dargestellt werden
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      presets = {
        bottom_search = true,         -- Nutze klassische Bottom Command-line für Search
        command_palette = true,        -- Position Command-palette Mittig
        long_message_to_split = true,  -- Lange Messages in Split anzeigen
        inc_rename = false,            -- Input-Dialog für inc-rename.nvim
        lsp_doc_border = false,        -- Border für LSP hover docs
      },
    },
  },
}
