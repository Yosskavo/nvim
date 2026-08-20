return {
    "cacarico/make.nvim",
    cmd = { "Make", "MakeToggle", "MakeTelescope" },
    keys = {
      { "<leader>mm", function() require("make").telescope() end, desc = "Make Target Picker (Telescope)" },
      { "<leader>mt", function() require("make").toggle() end, desc = "Toggle Make Terminal" },
      { "<leader>mr", function() require("make").run() end, desc = "Make Run Default Target" },
    },
	config = function()
		require("make").setup({
			close_on_finish = true,
		})
	end
}
