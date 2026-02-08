local M = {}

M.setup ={
	require("pretty_hover").setup({
		  opts = {
			border = "rounded", -- Set your global rounded look here
			column_limit = 80,  -- Prevents the window from being too wide
			max_height = 15,    -- Limits how tall the popup can get
		  },
	})
}

return M
