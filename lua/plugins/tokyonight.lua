return {
  "folke/tokyonight.nvim",
  style = "night",
  enabled = true,
  lazy = false,
  -- priority = 1000,
	config = function()
		require("config.tokyonight").setup()
      vim.cmd([[colorscheme tokyonight]])
    end,
}


-- a temporay one to know what we doing
