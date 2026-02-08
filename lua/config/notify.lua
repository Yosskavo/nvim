local M = {}

function M.setup()
	require("notify").setup(
	{
		stages = "slide",
		timeout = 1000,
		icons =
		{
			ERROR = " ",
			WARN  = " ",
			INFO  = " ",
			DEBUG = " ",
			TRACE = "✎ ",
		},
	})
end

return M
