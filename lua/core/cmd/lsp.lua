-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     local border = "rounded"
--
--     -- Apply rounded borders to hover and signature help for the attached client
--     vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
--       vim.lsp.handlers.hover, {
--         border = border,
--       }
--     )
--
--     vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
--       vim.lsp.handlers.signature_help, {
--         border = border,
--       }
--     )
--   end,
-- })
--
-- vim.api.nvim_create_autocmd('ColorScheme', {
--   callback = function()
--     vim.api.nvim_set_hl(0, 'LspReferenceTarget', {fg = "#112233"})
--   end,
-- })
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.semanticTokensProvider then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, { focus = false })
  end,
})

-- Forces the popup to hide markdown markers like ### and `
vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    vim.opt_local.conceallevel = 3
  end,
})
