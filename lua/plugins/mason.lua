return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      -- Automatisch installierte Language Server
      ensure_installed = {
        "lua_ls",        -- Lua
        "pyright",       -- Python
        "ts_ls",         -- TypeScript/JavaScript
        "html",          -- HTML
        "cssls",         -- CSS
        "jsonls",        -- JSON
      },
      automatic_installation = true,
    })
  end,
}
