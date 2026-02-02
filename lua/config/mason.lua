local M = {}

function M.setup()
require("mason").setup({
  ui = {
    border = "rounded",
    icons = {
      package_installed = "󱑤 ",
      package_pending = "󰦗 ",
      package_uninstalled = "󱂰 "
    },
    height = 0.5,
    width = 0.8,
  }
})
end

return M
