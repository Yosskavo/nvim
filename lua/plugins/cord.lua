return {
  'vyfor/cord.nvim',
  event = "VeryLazy",
  build = ':Cord update',
  -- opts = {}
  config = function()
	  require("config.cord").setup()
  end
}
