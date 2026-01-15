return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "vim", "vimdoc",
        "python", "javascript", "typescript", "tsx",
        "html", "css", "json", "yaml", "toml",
        "bash",
        "c", "cpp", "rust", "go",
        "markdown", "markdown_inline",
        "regex", "comment"
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = {
        enable = true,
      },
      sync_install = false,
      ignore_install = {},
      modules = {},
    })
  end,
}
