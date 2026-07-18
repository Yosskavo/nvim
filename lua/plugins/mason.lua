return {
    "mason-org/mason.nvim",
	config = true,
	lazy = false,
	enabled = true,
	config = function()
		require("config.mason").setup()
	end

}
