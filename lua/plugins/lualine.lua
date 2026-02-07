return {
    'nvim-lualine/lualine.nvim',
	config = function()
		require("config.lualine").setup()
	end
}
