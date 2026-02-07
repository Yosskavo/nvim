return function()
	local colors = require("core.theme.colors").my_colors

	vim.api.nvim_set_hl(0, "DashboardHeader", {fg = colors.blue_mid})
	vim.api.nvim_set_hl(0, "DashboardFooter", {fg = colors.light_purple, bold = true,})
end
