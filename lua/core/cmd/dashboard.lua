vim.api.nvim_create_autocmd("VimResized", {
  callback = function()
    if vim.bo.filetype == "dashboard" then
      vim.cmd("diffupdate") -- Forces a redraw of the current buffer
    end
  end,
})
vim.api.nvim_create_autocmd("WinClosed", {
  group = vim.api.nvim_create_augroup("LazyDashboardFallback", { clear = true }),
  callback = function(event)
    -- 1. Check if the window being closed is the lazy.nvim UI
    if vim.bo[event.buf].filetype == "lazy" then

      -- 2. Schedule the check for a fraction of a second later, 
      -- ensuring the lazy window is fully destroyed first
      vim.schedule(function()

        -- 3. Check if we are left with a completely empty, unnamed buffer
        if vim.api.nvim_buf_get_name(0) == "" and vim.bo.filetype == "" then
          -- 4. Trigger your specific dashboard. 
          -- Change "Alpha" to "Dashboard" if you use dashboard-nvim instead.
          pcall(vim.cmd, "Dashboard")
        end
      end)
    end
  end,
})
