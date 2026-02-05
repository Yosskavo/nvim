local M = {}

function M.setup()
	local mason_lspconfig = require("mason-lspconfig")
local servers = {
    "clangd",        -- C/C++
    "lua_ls",        -- Lua
    "pyright",       -- Python
    "ts_ls",         -- TypeScript/JS
    "rust_analyzer", -- Rust
  }
	vim.lsp.config('lua_ls', {
		settings = {
		  Lua = {
			diagnostics = {
			  -- This tells the LSP that 'vim' is a valid global variable
			  globals = { 'vim' },
			},
			workspace = {
			  -- This helps the LSP find Neovim's built-in functions
			  library = vim.api.nvim_get_runtime_file("", true),
			  checkThirdParty = false,
			},
		  },
		},
	  })
  mason_lspconfig.setup({
    ensure_installed = servers,
  })
	  vim.lsp.config('clangd', {
    -- Your server settings go here
    cmd = { "clangd", "--background-index" },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },})
	vim.lsp.enable(servers)
end

return M
