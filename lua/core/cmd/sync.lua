vim.api.nvim_create_autocmd("User", {
  pattern = "LazyInstall", 
  callback = function()
    -- Tell Neovim to wait for the UI to stabilize
    vim.schedule(function()
      -- Safely try to run the :Dashboard command without crashing
      pcall(vim.cmd, "Dashboard")
    end)

    vim.notify("Plugins Synced! Welcome back.", vim.log.levels.INFO, {
      title = "Lazy.nvim",
      icon = "󰚰 ",
    })
  end,
})
