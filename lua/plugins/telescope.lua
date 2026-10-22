return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
        "nvim-telescope/telescope-project.nvim",
    },
    cmd = { "Telescope", "SearchGitProjects", "GitProjects" },
    config = function()
        require("config.telescope").setup()
        require('telescope').load_extension("live_grep_args")
        pcall(function() require('telescope').load_extension("project") end)
    end,
}
