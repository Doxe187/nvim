return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    -- nvim-treesitter was rewritten: require("nvim-treesitter.configs") no longer exists.
    -- Parsers are installed via require("nvim-treesitter").install()
    -- Highlighting is handled by Neovim's built-in vim.treesitter.
    vim.schedule(function()
      require("nvim-treesitter").install({
        "lua", "vim", "vimdoc",
        "python", "javascript", "typescript",
        "tsx",
        "html", "css", "json", "yaml", "toml",
        "bash",
        "c", "cpp", "rust", "go",
        "markdown", "markdown_inline",
        "regex", "comment",
      })
    end)

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
