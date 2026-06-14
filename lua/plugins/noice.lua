return {
  "folke/noice.nvim",
  event = "VeryLazy",
  lazy = false,
  config = function()
	  require("config.noice").setup()
  end
}
