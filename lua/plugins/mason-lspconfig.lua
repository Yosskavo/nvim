return
{
	"williamboman/mason-lspconfig.nvim",
	lazy = false,
	config = function()
		require("config.mason-lspconfig").setup()
	end,
}
