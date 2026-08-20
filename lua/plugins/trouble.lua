return
{
	"folke/trouble.nvim",
	cmd = "Trouble",
	enabled = true,
	config = function()
		require("config.trouble").setup()
	end
}
