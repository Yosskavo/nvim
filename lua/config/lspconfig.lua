local M = {}
local map = vim.keymap.set

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
  --
end

-- disable semantic tokens
M.on_init = function(client)
  client.server_capabilities.semanticTokensProvider = nil
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.config = {
  on_attach = M.on_attach,
  on_init = M.on_init,
  capabilities = M.capabilities,
}

return M
