return {
  "folke/tokyonight.nvim",
  enabled = true,
  lazy = false,
  priority = 1000,
	config = function()
      -- This is where you call the command to apply the theme
      vim.cmd([[colorscheme tokyonight]])
    end,
}


-- a temporay one to know what we doing
