local M = {}

function M.setup()

require('telescope').setup{
    defaults = {
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
            prompt_prefix = " 󰈞 ",
            prompt_title = "search for a file",
            default_text = "",
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
