vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "oil://*", -- Only trigger inside Oil buffers
  callback = function()
    -- This triggers the confirmation menu immediately
    require("oil").save()
  end,
})
