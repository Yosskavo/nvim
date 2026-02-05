local M = {}

function M.setup()
	require("toggleterm").setup
	{
		open_mapping = [[<c-/>]],
		direction = "float",
		persist_size = true,
		highlights =
		{
			-- NormalFloat =
			-- {
			--      		link = "NormalFloat", -- Links to the TokyoNight darker background
			--  		},
			FloatBorder =
			{
				link = "FloatBorder",
			},
		},
		float_opts =
		{
			border = "rounded",
			width = function()
				return math.ceil(vim.o.columns * 0.75)
			end,
			height = function()
				return math.ceil(vim.o.lines * 0.75)
			end,
			winblend = 0,
			-- title = "  Terminal ",
			-- title_pos = "center", -- Puts the name in the middle of the top border
		},
		winbar = {
			enabled = false,
			name_formatter = function(term) --  term: Terminal
			  return term.name
			end
		},
  }
	vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*",
        callback = function()
            local opts = { buffer = 0 }
			-- Your requested mapping to exit Terminal mode to Normal mode
			vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        end,
    })
end


return M
