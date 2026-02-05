return {
	  'romgrk/barbar.nvim',
	  init = function() vim.g.barbar_auto_setup = false end,
	  config = function()
		  require("config.barbar").setup()
	  end
}
