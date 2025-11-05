return {
  "kylechui/nvim-surround",
  version = "*",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("nvim-surround").setup({
      -- Standardkonfiguration
      -- ys{motion}{char} - Hinzufügen
      -- ds{char} - Löschen
      -- cs{target}{replacement} - Ändern
    })
  end,
}
