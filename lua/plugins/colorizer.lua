return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup({
      "*", -- Für alle Dateien aktivieren
    }, {
      RGB = true,      -- #RGB hex codes
      RRGGBB = true,   -- #RRGGBB hex codes
      names = true,    -- "Name" codes wie Blue
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      rgb_fn = true,   -- CSS rgb() und rgba() Funktionen
      hsl_fn = true,   -- CSS hsl() und hsla() Funktionen
      css = true,      -- CSS-Farbwörter aktivieren
      css_fn = true,   -- CSS-Funktionen aktivieren
    })
  end,
}
