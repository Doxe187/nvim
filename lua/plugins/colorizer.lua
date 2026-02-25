return {
  -- Gewechselt von norcalli zu NvChad - aktiv gewartet, keine deprecated APIs
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup({
      filetypes = { "*" }, -- Für alle Dateien aktivieren
      user_default_options = {
        RGB = true,      -- #RGB hex codes
        RRGGBB = true,   -- #RRGGBB hex codes
        names = true,    -- "Name" codes wie Blue
        RRGGBBAA = true, -- #RRGGBBAA hex codes
        rgb_fn = true,   -- CSS rgb() und rgba() Funktionen
        hsl_fn = true,   -- CSS hsl() und hsla() Funktionen
        css = true,      -- CSS-Farbwörter aktivieren
        css_fn = true,   -- CSS-Funktionen aktivieren
        mode = "background", -- Optionen: foreground, background, virtualtext
        tailwind = false,
        sass = { enable = false },
        virtualtext = "",
      },
      buftypes = {},
    })
  end,
}
