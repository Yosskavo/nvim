local M = {}

function M.setup()

require('telescope').setup{
	defaults = {
		selection_caret = "󰁙 ",
		mappings = {
			i = {
				["<C-h>"] = "which_key"
			}
		}
	},
	pickers = {
		find_files = {
			prompt_prefix = "󰈞 ",
			prompt_title = "search for a file"
		},
		live_grep = {
			prompt_prefix = "󱁊 ",
			prompt_title = "search for a word"
		}
	},
	extensions = {
	},
}

end

return M
