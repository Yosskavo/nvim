local M = {}

local add = '+'
local change = '*'
local delete = '-'

function M.setup()
	require("gitsigns").setup({
		current_line_blame = true,
		  signs = {
			add          = { text = add },
			change       = { text = change },
			delete       = { text = delete },
			topdelete    = { text = '‾' },
			changedelete = { text = '~' },
			untracked    = { text = '┆' },
		  },
		  signs_staged = {
			add          = { text = add },
			change       = { text = change },
			delete       = { text = delete },
			topdelete    = { text = '‾' },
			changedelete = { text = '~' },
			untracked    = { text = '┆' },
		  },
	})
end

return M
