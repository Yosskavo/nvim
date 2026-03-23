return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
    },
    cmd = "Telescope",
    config = function()
        require("config.telescope").setup()
        require('telescope').load_extension("live_grep_args")
    end,
}
