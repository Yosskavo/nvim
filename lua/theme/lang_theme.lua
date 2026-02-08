-- TODO: here to config everything about the language things {variables, datatypes, functions, ...}

return function()
	local colors = require("core.theme.colors").my_colors

	vim.api.nvim_set_hl(0, "@variable", { fg = colors.light_blue, force = true })
	vim.api.nvim_set_hl(0, "@variable.parameter", { fg = colors.light_red, force = true })
	vim.api.nvim_set_hl(0, "@type.builtin", { fg = colors.violet_glow, force = true })
	vim.api.nvim_set_hl(0, "Function", { fg = colors.type_blue, force = true })
	vim.api.nvim_set_hl(0, "@function.call.c", { fg = colors.blue_main, force = true })
	vim.api.nvim_set_hl(0, "@function.call.cpp", { fg = colors.blue_main, force = true })
	vim.api.nvim_set_hl(0, "String", { fg = colors.light_orange, force = true })
	vim.api.nvim_set_hl(0, "PreProc", { fg = colors.light_teal, bold = true, force = true })
	vim.api.nvim_set_hl(0, "@keyword", { fg = colors.light_purple, bold = true, italic = true, force = true })
	vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = colors.light_green, force = true })
	vim.api.nvim_set_hl(0, "Constant", { fg = colors.peach_light, force = true })
	vim.api.nvim_set_hl(0, "@number.c", { fg = colors.green_main, force = true })
	vim.api.nvim_set_hl(0, "@number.cpp", { fg = colors.green_main, force = true })
	vim.api.nvim_set_hl(0, "Type", { fg = colors.emerald, force = true })
	vim.api.nvim_set_hl(0, "@type.definition.c", { fg = colors.tan, force = true })
	vim.api.nvim_set_hl(0, "@type.definition.cpp", { fg = colors.tan, force = true })
	vim.api.nvim_set_hl(0, "@operator", { fg = colors.violet, force = true })
	vim.api.nvim_set_hl(0, "@property", { fg = colors.blue_main, force = true })
	vim.api.nvim_set_hl(0, "@spell", { fg = colors.fg_soft, italic = true, force = true })
	vim.api.nvim_set_hl(0, "@property", { fg = colors.blue_main, force = true })
	vim.api.nvim_set_hl(0, "@function.method.call.cpp", { fg = colors.light_yellow, force = true })
	vim.api.nvim_set_hl(0, "@function.method.cpp", { fg = colors.light_yellow, force = true })
	vim.api.nvim_set_hl(0, "Statement", { fg = colors.gold, bold = true, italic = true, underline = true, force = true })

end
