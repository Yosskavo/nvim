return {
	'nvim-telescope/telescope-fzf-native.nvim', 
	enabled = true,
	build = 'make',
	config = function()
		require("config.telescope-fzf").setup()
  	end
}
