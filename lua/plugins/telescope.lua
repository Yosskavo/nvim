return {
    'nvim-telescope/telescope.nvim',
	enabled = true,
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
	config = function()
		require("config.telescope").setup()
	end,
}
