return {
    'nvim-telescope/telescope.nvim',
	enabled = true,
	config = function()
		require("config.telescope").setup()
	end,
}
