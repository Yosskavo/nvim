local M = {}

function M.setup()
  local mason_lspconfig = require("mason-lspconfig")
  local base = require("config.lspconfig").config
  local cmp_capabilities = require('cmp_nvim_lsp').default_capabilities()

  base.capabilities = vim.tbl_deep_extend("force", base.capabilities or {}, cmp_capabilities)

  local servers = {
    "clangd",
    "lua_ls",
	-- "html",
	-- "cssls",
    "pyright",
    -- "ts_ls",
    -- "rust_analyzer",
  }

  mason_lspconfig.setup({
    ensure_installed = servers,
  })

  -- Lua
  vim.lsp.config("lua_ls", vim.tbl_extend("force", base, {
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
      },
    },
  }))

  -- Clangd
  vim.lsp.config("clangd", vim.tbl_extend("force", base, {
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  }))

  -- Everything else (no extra config)
  vim.lsp.config("pyright", base)
  vim.lsp.config("ts_ls", base)
  -- vim.lsp.config("rust_analyzer", base)
  -- vim.lsp.config("html", base)
  -- vim.lsp.config("cssls", base)

  -- Enable AFTER configs are defined
  vim.lsp.enable(servers)
end

return M
