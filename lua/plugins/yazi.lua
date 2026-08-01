return {
  "mikavilpas/yazi.nvim",
  event = "VeryLazy",
  cmd = "Yazi",
  keys = {
    { "<A-y>", "<cmd>Yazi<cr>", desc = "Open Yazi" },
    { "<leader>cw", "<cmd>Yazi<cr>", desc = "Open Yazi at current file" },
    { "<leader>cW", "<cmd>Yazi cwd<cr>", desc = "Open Yazi in cwd" },
  },
  opts = {
    open_for_directories = true,
    keymaps = {
      show_help = "<f1>",
    },
  },
}

