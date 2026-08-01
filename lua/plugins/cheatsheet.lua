return {
  "sudormrfbin/cheatsheet.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  cmd = { "Cheatsheet", "CheatsheetEdit" },
  keys = {
    { "<leader>?", "<cmd>Cheatsheet<cr>", desc = "Cheatsheet" },
  },
  opts = {
    bundled_cheatsheets = {
      enabled = { "default", "lua", "markdown", "regex", "netrw", "unicode" },
    },
    bundled_plugin_cheatsheets = {
      enabled = { "auto-session", "goto-preview", "telescope.nvim" },
    },
  },
}

