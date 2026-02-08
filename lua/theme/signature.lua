return function()

	local colors = require("core.theme.colors").my_colors

	vim.api.nvim_set_hl(0, "LspSignatureActiveParameter", {fg = colors.gold, undercurl = true, bold = true, bg = colors.bg_alt})
end
