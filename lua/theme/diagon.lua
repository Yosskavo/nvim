return function()

	local colors = require("core.theme.colors").my_colors

	vim.api.nvim_set_hl(0, "DiagnosticUnderlineError", {fg = colors.deep_blood, undercurl = true, bold = true})
end
