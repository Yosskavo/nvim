local M = {}

function M.setup()
	require("cord").setup
	{
		display =
		{
			theme = "catppuccin",
			flavor = "dark",
			view = "asset",
		},
	}
end

return M
