-- Add this to your init.lua
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "lua", "python" }, -- Add the languages you use
  callback = function()
    -- This ensures the spell checking applies to the buffer
    vim.opt_local.spell = true
  end,
})
