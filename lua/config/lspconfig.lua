local M = {}
local map = vim.keymap.set

vim.diagnostic.config ({
	virtual_text = false,
	float =
	{
		focusable = false,
		style = "minimal",
		border = "rounded",
		header = "",
		prefix = "-> ",
		source = false
	},
})

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
  local name = "DiagnosticSign" .. type
  vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end


M.on_attach = function(_, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  -- navigation
  map("n", "gD", vim.lsp.buf.declaration, opts "Go to declaration")
  map("n", "gd", vim.lsp.buf.definition, opts "Go to definition")
  map("n", "<leader>D", vim.lsp.buf.type_definition, opts "Go to type definition")

  -- workspace
  map("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts "Add workspace folder")
  map("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts "Remove workspace folder")
  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, opts "List workspace folders")

  -- actions
  map("n", "<leader>ra", vim.lsp.buf.rename, opts "Rename symbol")
end
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- disable semantic tokens
M.on_init = function(client)
  client.server_capabilities.semanticTokensProvider = nil
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.hover.contentFormat = { "markdown", "plaintext" }

M.config = {
  on_attach = M.on_attach,
  on_init = M.on_init,
  capabilities = M.capabilities,
}

return M
