return
{
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
	  require("config.which-key").setup()
  end
}
