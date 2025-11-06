return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      view = {
        width = 30,
        side = "left",
      },
      renderer = {
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
            },
          },
        },
      },
      filters = {
        dotfiles = false,
      },
      update_focused_file = {
        enable = true,
        update_root = false,
      },
      filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = {
          "node_modules",
          ".git",
        },
      },
      actions = {
        open_file = {
          quit_on_open = false,
        },
      },
      git = {
        enable = true,
        ignore = false,
      },
    })
  end,
}
