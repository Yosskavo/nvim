local M = {}
local map = vim.keymap.set

vim.diagnostic.config({
  virtual_text = {
    prefix = function(diagnostic)
      local icons = {
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.HINT] = "󰠠 ",
        [vim.diagnostic.severity.INFO] = " ",
      }
      return icons[diagnostic.severity] or "● "
    end,
    spacing = 4,
    source = false,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.HINT] = "󰠠 ",
      [vim.diagnostic.severity.INFO] = " ",
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    header = "",
    prefix = "-> ",
    source = false,
  },
})

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
for type, icon in pairs(signs) do
  local name = "DiagnosticSign" .. type
  vim.fn.sign_define(name, { text = icon, texthl = name, numhl = "" })
end


M.on_attach = function(client, bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  -- Enable Inlay Hints persistently
  if client and client.supports_method("textDocument/inlayHint") then
    local inlay_hints_enabled = require("core.state").get("inlay_hints", true)
    vim.lsp.inlay_hint.enable(inlay_hints_enabled, { bufnr = bufnr })
  end

  -- Toggle Inlay Hints keymap persistently
  map("n", "<leader>uh", function()
    local is_enabled = not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr })
    vim.lsp.inlay_hint.enable(is_enabled, { bufnr = bufnr })
    require("core.state").set("inlay_hints", is_enabled)
    vim.notify("Inlay hints " .. (is_enabled and "enabled" or "disabled") .. " globally")
  end, opts "Toggle Inlay Hints")

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

-- disable semantic tokens
M.on_init = function(client)
  client.server_capabilities.semanticTokensProvider = nil
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
if M.capabilities.textDocument and M.capabilities.textDocument.hover then
  M.capabilities.textDocument.hover.contentFormat = { "markdown", "plaintext" }
end

M.config = {
  on_attach = M.on_attach,
  on_init = M.on_init,
  capabilities = M.capabilities,
  autostart = require("core.state").get("lsp_autostart", true),
}

return M
