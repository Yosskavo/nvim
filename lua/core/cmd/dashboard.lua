vim.api.nvim_create_autocmd("VimResized", {
  callback = function()
    if vim.bo.filetype == "dashboard" then
      vim.cmd("diffupdate") -- Forces a redraw of the current buffer
    end
  end,
})
