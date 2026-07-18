return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {
	prompt = {
		  -- Change the default "⚡" to your preferred icon
		  prefix = { { " ", "FlashPromptIcon" } },
		},
  },
}
