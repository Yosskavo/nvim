

function M.stup()
	require("lspconfig").setup
	{
		vim.diagnostic.config({
		  float = { border = "rounded" },
		})
	}
end

return M
