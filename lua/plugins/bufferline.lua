return
{
	"akinsho/bufferline.nvim",
	config = function()
		local groups = require("bufferline.groups")
        groups.builtin.pinned.icon = "󰐃 "
		require("config.bufferline").setup()
	end
}
