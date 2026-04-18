-- Disable folding for UI-related filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "oil", "alpha", "dashboard", "norg", "TelescopePrompt" },
  callback = function()
    vim.opt_local.foldenable = false
    vim.opt_local.foldmethod = "manual"
    vim.opt_local.foldcolumn = "0"
  end,
})
