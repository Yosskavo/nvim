local M = {}

function M.setup()
	require("screenkey").setup({
		win_opts =
		{
			row = vim.o.lines - 3,
            col = vim.o.columns,
            width = 40,
            height = 1,
		}
	})
end

return M
