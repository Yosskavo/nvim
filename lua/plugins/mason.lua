return {
    "mason-org/mason.nvim",
	config = true,
	enabled = true,
	config = function()
		require("config.mason").setup()
	end

}
