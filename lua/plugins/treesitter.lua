return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "vim", "vimdoc",
        "python", "javascript", "typescript", "tsx", "jsx",
        "html", "css", "json", "yaml", "toml",
        "bash", "sh",
        "c", "cpp", "rust", "go",
        "markdown", "markdown_inline",
        "regex", "comment"
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
}
