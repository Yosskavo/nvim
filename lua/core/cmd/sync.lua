-- In your init.lua or a dedicated autocmds.lua file
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyInstall", -- Or "LazySync" for new plugins
  callback = function()
    -- 1. Safely try to load Alpha without crashing
    local status_ok, alpha = pcall(require, "alpha")
    
    -- 2. Only start it if it actually loaded successfully
    if status_ok then
      alpha.start()
    end

    -- 3. Your notification will now always trigger safely!
    vim.notify("Plugins Synced! Welcome back.", vim.log.levels.INFO, {
      title = "Lazy.nvim",
      icon = "󰚰 ",
    })
  end,
})
