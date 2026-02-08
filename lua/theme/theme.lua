-- this is for color scheme
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
		require("theme.oper")()
		require("theme.background")()
		require("theme.float_wind")()
		require("theme.yank")()
		require("theme.line")()
		require("theme.lang_theme")()
		require("theme.dashboard")()
		require("theme.diagon")()
		require("theme.barbar")()
		require("theme.notify")()
    end,
})


require("theme.notify")()
require("theme.dashboard")()
require("theme.barbar")()
require("theme.oper")()
require("theme.background")()
require("theme.float_wind")()
require("theme.yank")()
require("theme.line")()
require("theme.lang_theme")()
require("theme.diagon")()
