return {
  "b0o/incline.nvim",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = require("tokyonight.colors").setup()
    local devicons = require("nvim-web-devicons")

    require("incline").setup({
      highlight = {
        groups = {
          InclineNormal = { guibg = colors.bg_dark, guifg = colors.fg },
          InclineNormalNC = { guibg = colors.bg_dark, guifg = colors.fg_dark },
        },
      },
      window = {
        padding = 0,
        margin = { horizontal = 1, vertical = 0 },
        placement = { horizontal = "right", vertical = "top" },
      },
      hide = {
        cursorline = false,
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if filename == "" then
          filename = "[No Name]"
        end

        local ft_icon, ft_color = devicons.get_icon_color(filename)
        local modified = vim.bo[props.buf].modified

        return {
          ft_icon and { " ", ft_icon, " ", guifg = ft_color } or { " " },
          { filename },
          modified and { " [+] " } or { " " },
        }
      end,
    })
  end,
}
