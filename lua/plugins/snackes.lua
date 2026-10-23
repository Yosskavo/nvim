return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    image = { enabled = true }, -- Enables the image viewer component
	bigfile = { enabled = true },
    dashboard = { enabled = false },
    explorer = { enabled = false },
    notifier = { enabled = false },
    picker = { enabled = false },
  },
}
