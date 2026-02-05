return
{
	"catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
	config = function()
		require("config.colorizer").setup()
	end
}
