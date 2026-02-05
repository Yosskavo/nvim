return function()
	local color = require("core.theme.colors").my_colors
	--- this is for highlight the yank (copy) to know what you copied
	vim.api.nvim_set_hl(0, "yankhl", {bg = color.orange_burnt, fg = "none"})

	vim.api.nvim_create_autocmd("textyankpost",
	{
		callback = function()
			vim.highlight.on_yank({
				higroup = "yankhl",
				timeout = 200
			})
		end
	})
end
