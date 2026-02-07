return {
  "folke/noice.nvim",
  event = "VeryLazy",
  config = function()
	  require("config.noice").setup()
  end
}
