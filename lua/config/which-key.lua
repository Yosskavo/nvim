local M = {}

function M.setup()
	require("which-key").setup
	{
		global = false,
		win =
		{
			width = 35,
			height = 15,
			col = 0,
			row = vim.o.lines - 50,
			padding = {1, 2},
			no_overlap = false,
			title = true,
			title_pos = "center",
			border = "rounded",
			zindex = 1000,
		},
		layout =
		{
			width = { min = 20, max = 30 }, -- This forces the window limits
    		spacing = 3, -- Space between icon and text
			columns = 1,
		},
	}
end

return M
