local M = {}

function M.setup()
	require("oil").setup
	{
		default_file_explorer = true,
		keymaps =
		{
			["q"] = "actions.close"
		},
		columns =
		{
			"icon",
			-- "permissions",
			-- "size",
			-- "mtime",
		},
		win_options =
		{
			wrap = false,
			signcolumn = "no",
			cursorcolumn = false,
			foldcolumn = "0",
			spell = false,
			list = false,
			conceallevel = 3,
			concealcursor = "nvic",
			-- winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder",
		  },
		  -- Floating window settings (for when you run :Oil --float)
		float =
		{
			padding = 2,
			max_width = 0.6,
			max_height = 0.5,
			border = "rounded",
			win_options =
			{
				winblend = 0,
			},
		},
	}
end

return M
