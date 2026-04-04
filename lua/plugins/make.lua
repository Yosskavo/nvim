return {
    "cacarico/make.nvim",
	config = function()
		require("make").setup({
			close_on_finish = true,
		})
	end
}
