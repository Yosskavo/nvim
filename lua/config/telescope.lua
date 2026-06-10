local M = {}

function M.setup()

require('telescope').setup{
    defaults = {
		-- path_display = function()
		-- 	local utils = require("telescope.utils")
		-- 	local tail = utils.path_tail(path)
		-- 	local dir = path:gsub(tail .. "$", "")
		-- 	-- Strip the extension from the filename
		-- 	-- The regex `^(.+)%.[^%.]+$` ensures dotfiles like `.gitignore` remain untouched
		-- 	local name_no_ext = tail:match("^(.+)%.[^%.]+$") or tail
		-- 	-- Format the output. 
		-- 	-- Example: "main (src/)" instead of "src/main.cpp"
		-- 	if dir == "" then
		-- 	  return name_no_ext
		-- 	else
		-- 	  return string.format("%s (%s)", name_no_ext, dir)
		-- 	end
		-- end,
        selection_caret = "   ",
        entry_prefix = " ",
        sorting_strategy = "ascending",
        layout_config = {
              horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
              },
            width = 0.87,
              height = 0.80,
        },
        mappings = {
            n = { ["q"] = require("telescope.actions").close },
            i = { ["<C-h>"] = "which_key"},
        },
    },
    pickers = {
        find_files = {
			find_command = { "rg", "--files", "--color", "never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" },
            prompt_prefix = " 󰈞 ",
            prompt_title = "search for a file",
            default_text = "",
			no_ignore = false,
        },
        live_grep = {
            prompt_prefix = " 󱁊 ",
            prompt_title = "search for a word",
            default_text = "",
        },
    },
    extensions = {
      live_grep_args = {
        auto_quoting = true,
      },
    },
}

end

return M
