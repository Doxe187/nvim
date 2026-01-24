return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = {
        "lua", "vim", "vimdoc",
        "python", "javascript", "typescript", "tsx",
        "html", "css", "json", "yaml", "toml",
        "bash",
        "c", "cpp", "rust", "go",
        "markdown", "markdown_inline",
        "regex", "comment"
      },
    })

    -- Enable treesitter-based highlighting (built into Neovim 0.10+)
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
