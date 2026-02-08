-- In your init.lua or a dedicated autocmds.lua file
vim.api.nvim_create_autocmd("User", {
  pattern = "LazyInstall", -- Or "LazySync" for new plugins
  callback = function()
    -- For Alpha-nvim:
    require("alpha").start()

    -- OR for Dashboard-nvim:
    -- vim.cmd("Dashboard")

    vim.notify("Plugins Synced! Welcome back.", vim.log.levels.INFO, {
      title = "Lazy.nvim",
      icon = "󰚰 ",
    })
  end,
})
