return function()
	local colors = require("core.theme.colors").my_colors
	local n = vim.api

	-- Search results (current and all others)
	n.nvim_set_hl(0, "Search", { bg = colors.yellow, fg = colors.bg })
	n.nvim_set_hl(0, "IncSearch", { bg = colors.orange, fg = colors.bg, bold = true })

	-- Text affected by a "substitute" command
	n.nvim_set_hl(0, "Substitute", { bg = colors.red, fg = colors.bg })

	-- The line the cursor is currently on
	n.nvim_set_hl(0, "CursorLine", { bg = colors.blur_overlay})

	-- Matching parenthesis (e.g., when you click on a { for cub3d)
	n.nvim_set_hl(0, "MatchParen", {bg = colors.silver, fg = colors.cyan, bold = true, underline = true })

	n.nvim_set_hl(0, "Visual", {bg = colors.purple_deep})
end
