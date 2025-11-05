return {
  "hrsh7th/cmp-nvim-lsp",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- Keybindings für LSP
    local on_attach = function(client, bufnr)
      local opts = { buffer = bufnr, silent = true }

      opts.desc = "Zeige LSP-Referenzen"
      vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

      opts.desc = "Gehe zu Deklaration"
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

      opts.desc = "Zeige LSP-Definitionen"
      vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

      opts.desc = "Zeige LSP-Implementierungen"
      vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

      opts.desc = "Zeige LSP-Type-Definitionen"
      vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

      opts.desc = "Zeige verfügbare Code-Actions"
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

      opts.desc = "Smart Rename"
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

      opts.desc = "Zeige Buffer-Diagnostics"
      vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

      opts.desc = "Zeige Line-Diagnostics"
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

      opts.desc = "Gehe zu vorherigem Diagnostic"
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

      opts.desc = "Gehe zu nächstem Diagnostic"
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

      opts.desc = "Zeige Dokumentation"
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

      opts.desc = "Restart LSP"
      vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
    end

    -- Erweiterte Capabilities für nvim-cmp
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Diagnostics-Symbole konfigurieren
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Language Server konfigurieren mit der nativen vim.lsp.config API
    vim.lsp.config("lua_ls", {
      cmd = { "lua-language-server" },
      filetypes = { "lua" },
      root_markers = { ".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git" },
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    vim.lsp.config("pyright", {
      cmd = { "pyright-langserver", "--stdio" },
      filetypes = { "python" },
      root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.config("ts_ls", {
      cmd = { "typescript-language-server", "--stdio" },
      filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
      root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.config("html", {
      cmd = { "vscode-html-language-server", "--stdio" },
      filetypes = { "html" },
      root_markers = { "package.json", ".git" },
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.config("cssls", {
      cmd = { "vscode-css-language-server", "--stdio" },
      filetypes = { "css", "scss", "less" },
      root_markers = { "package.json", ".git" },
      capabilities = capabilities,
      on_attach = on_attach,
    })

    vim.lsp.config("jsonls", {
      cmd = { "vscode-json-language-server", "--stdio" },
      filetypes = { "json", "jsonc" },
      root_markers = { "package.json", ".git" },
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- LSP automatisch für die konfigurierten Dateitypen aktivieren
    vim.lsp.enable({ "lua_ls", "pyright", "ts_ls", "html", "cssls", "jsonls" })
  end,
}
