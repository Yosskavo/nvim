local M = {}

function M.start()
	local colors = require("core.theme.colors").my_colors
	vim.api.nvim_set_hl(0, "CursorLineNr", {fg = colors.blue_accent, italic = true, bold = true})
	vim.api.nvim_set_hl(0, "LineNrAbove", {fg = colors.teal})
	vim.api.nvim_set_hl(0, "LineNrBelow", {fg = colors.teal})
end

return M.start
