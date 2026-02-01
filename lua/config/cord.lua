local M = {}

function M.setup()
	require("cord").setup
	{
		display =
		{
			theme = "catppuccin",
			flavor = "dark",
			veiw = "asset",
		},
	}
end

return M
