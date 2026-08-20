local M = {}

function M.setup()
  -- Suppress Mason installation popup errors/notifications on the screen
  -- Errors will still be visible in :checkhealth mason, :Mason, and :MasonLog
  local orig_notify = vim.notify
  vim.notify = function(msg, level, opts)
    if type(msg) == "string" and (
      msg:lower():match("mason") or 
      msg:match("Installation failed") or 
      msg:match("Failed to spawn process") or
      msg:match("is not available")
    ) then
      return
    end
    orig_notify(msg, level, opts)
  end

  require("mason").setup({
    ui = {
      border = "rounded",
      check_outdated_packages_on_open = false,
      icons = {
        package_installed = "󱑤 ",
        package_pending = "󰦗 ",
        package_uninstalled = "󱂰 ",
      },
      height = 0.5,
      width = 0.8,
    },
    log_level = vim.log.levels.INFO,
  })
end

return M
