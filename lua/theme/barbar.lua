return function()
	local  colors = require("core.theme.colors").my_colors

	-- the default for each two
	vim.api.nvim_set_hl(0, "BufferCurrent", {bg = colors.marine_deep})
	vim.api.nvim_set_hl(0, "BufferVisible", {bg = colors.marine_mist})

	-- the pin icon
	vim.api.nvim_set_hl(0, "BufferCurrentPin", {fg = colors.rose, bg = colors.marine_deep})
	vim.api.nvim_set_hl(0, "BufferVisiblePin", {fg = colors.rose, bg = colors.marine_mist})

	-- the error icon
	vim.api.nvim_set_hl(0, "BufferVisibleERROR", {fg = colors.deep_blood, bg = colors.marine_mist})
	vim.api.nvim_set_hl(0, "BufferCurrentERROR", {fg = colors.red, bg = colors.marine_deep})

	-- the hint icon
	vim.api.nvim_set_hl(0, "BufferVisibleHINT", {fg = colors.green_lime, bg = colors.marine_mist})
	vim.api.nvim_set_hl(0, "BufferCurrentHINT", {fg = colors.light_green, bg = colors.marine_deep})

	-- the modified icon
	vim.api.nvim_set_hl(0, "BufferVisibleMod", {fg = colors.gold, bg = colors.marine_mist})
	vim.api.nvim_set_hl(0, "BufferCurrentMod", {fg = colors.yellow, bg = colors.marine_deep})

	-- the modified icon
	vim.api.nvim_set_hl(0, "BufferVisibleWARN", {fg = colors.light_yellow, bg = colors.marine_mist})
	vim.api.nvim_set_hl(0, "BufferCurrentWARN", {fg = colors.abyss_yellow_fg, bg = colors.marine_deep})

end
