return {
    "kylechui/nvim-surround",
    event = "VeryLazy",
	version = "*",
	config = function()
		require("nvim-surround").setup({})
	end
}
