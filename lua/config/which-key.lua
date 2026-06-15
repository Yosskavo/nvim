local M = {}

function M.setup()
	require("which-key").setup
	{
		global = false,
		win =
		{
			wo =
			{
				winblend = 0,
			},
			width = 35,
			height = 15,
			col = 0,
			row = vim.o.lines - 50,
			padding = {1, 2},
			no_overlap = false,
			title = true,
			title_pos = "center",
			-- windblend = 0,
			border = "rounded",
			zindex = 1000,
		},
		layout =
		{
			height = { min = 4, max = 10 },  -- adjust max height if needed
			width  = { min = 20, max = 40 }, -- adjust max width
			-- width = { min = 20, max = 30 }, -- This forces the window limits
    		spacing = 3, -- Space between icon and text
			columns = 1,
		},
	}
	require("which-key").add({
	  { "<leader>s", group = "Screen" },
      { "<leader>b", group = "Buffers" },
      { "<leader>f", group = "Find/Files" },
      { "<leader>t", group = "terminal" },
      { "<leader>l", group = "lazy" },
      { "<leader>m", group = "makefile" },
      { "<leader>h", group = "help" },
      { "<leader>x", group = "lsp" },
      { "<leader>w", group = "lsp workflow" },
	  { "<leader>g", group = "glance"},
      { "<localleader>f", group = "formatting" },
      { "<localleader>s", group = "formatting" },
      { "<localleader>s", group = "typr" },

	})
end

return M
