return
{
	"ahmedkhalf/project.nvim",
	event = "VeryLazy",
	config = function()
		require("config.project").setup()
	end
}
