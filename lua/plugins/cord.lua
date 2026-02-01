return {
  'vyfor/cord.nvim',
  build = ':Cord update',
  -- opts = {}
  config = function()
	  require("config.cord").setup()
  end
}
