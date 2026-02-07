local M = {}

function M.setup()
	require("project_nvim").setup({
		manual_mode = false,
		detection_methods = {
			"pattern",
			"lsp",
		},
		patterns = {
        ".git",
        "_darcs",
        ".hg",
        ".bzr",
        ".svn",
        "Makefile",    -- Essential for 42 projects like cub3d
        "package.json",
        "CMakeLists.txt"
      },
	  datapath = vim.fn.stdpath("data")
	})
end

return M
