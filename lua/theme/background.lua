return function()
	local colors = require("core.theme.colors").my_colors

	-- this is for the background
	vim.api.nvim_set_hl(0, "Normal",      { bg = colors.bg_alt , fg = colors.marine_light})
	vim.api.nvim_set_hl(0, "SignColumn",      { bg = colors.bg })

	-- this is for the un-active window/buffer
	vim.api.nvim_set_hl(0, "NormalNC",    { bg = colors.blur_overlay, fg = colors.fg_main})
	-- active floating window
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = colors.bg_alt})

	-- the backgroud for the which key
	vim.api.nvim_set_hl(0, "WhichKeyNormal", { bg = colors.bg_dim })

	-- the background float lazy wind
	vim.api.nvim_set_hl(0, "LazyGitFloat", { bg = colors.bg_alt })
end
