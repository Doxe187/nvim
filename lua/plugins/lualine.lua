return {
  "nvim-lualine/lualine.nvim",
  enabled = false,  -- Plugin deaktiviert, aber Konfiguration bleibt erhalten
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "nightfox",  -- Korrigiert: passt zum aktiven Colorscheme
        component_separators = { left = "|", right = "|" },
        section_separators = { left = "", right = "" },
      },
    })
  end,
}
