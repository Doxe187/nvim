return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "lua", "vim", "vimdoc",
        "python", "javascript", "typescript",
        "tsx",
        "html", "css", "json", "yaml", "toml",
        "bash",
        "c", "cpp", "rust", "go",
        "markdown", "markdown_inline",
        "regex", "comment"
      },

      -- WICHTIG: Highlight aktivieren für Syntax-Highlighting
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      -- Indent basierend auf Treesitter
      indent = {
        enable = true,
      },

      -- Automatische Installation fehlender Parser
      auto_install = true,
    })

    -- Enable treesitter-based highlighting (built into Neovim 0.10+)
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })

    -- Eigener Autocmd: Treesitter direkt per BufEnter/BufReadPost starten
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile", "BufEnter" }, {
      callback = function(args)
        local buf = args.buf
        local ft = vim.bo[buf].filetype
        if ft ~= "" and ft ~= "NvimTree" then
          pcall(vim.treesitter.start, buf)
        end
      end,
    })
  end,
}
