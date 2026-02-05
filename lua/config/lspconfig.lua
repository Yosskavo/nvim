-- List the servers you want to enable
local servers = { 'pyright', 'lua_ls', 'ts_ls', 'rust_analyzer' }

-- 1. Enable the servers (This replaces the old .setup() loop)
vim.lsp.enable(servers)

-- 2. General LSP Configuration (Optional)
-- This applies to all servers automatically
vim.lsp.config('*', {
  root_markers = { '.git', 'package.json', 'pyproject.toml' },
})

-- 3. Server-Specific Settings
-- This is how you handle specific server tweaks now
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        checkThirdParty = false,
      },
    },
  },
})
