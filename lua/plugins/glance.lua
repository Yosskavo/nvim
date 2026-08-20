return {
  "dnlhc/glance.nvim",
  cmd = "Glance",
  keys = {
    { "<leader>gd", "<cmd>Glance definitions<CR>", desc = "Glance definitions" },
    { "<leader>gR", "<cmd>Glance references<CR>", desc = "Glance References" },
    { "<leader>gY", "<cmd>Glance type_definitions<CR>", desc = "Glance Type Definition" },
    { "<leader>gM", "<cmd>Glance implementations<CR>", desc = "Glance Implementation" },
  },
  config = function()
    require('config.glance').setup()
  end,
}
