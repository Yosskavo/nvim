return {
  "MrSloth-dev/Switcheroo.nvim",
  lazy = false, -- This is IMPORTANT so it loads on startup
  priority = 1000, -- Load before EVERYTHING else
  config = function()
    require("Switcheroo").setup({
		default_theme = "kanagawa",
		persist = true,
	})
  end,
}
