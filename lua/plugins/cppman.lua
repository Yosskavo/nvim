return {
  "madskjeldgaard/cppman.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = { "CPPMan" },
  keys = {
    {
      "<leader>cm",
      function() require("cppman").open_cppman_for_current_word() end,
      desc = "CPPMan (word under cursor)",
    },
    {
      "<leader>cM",
      function() require("cppman").open_cppman_search() end,
      desc = "CPPMan Search",
    },
  },
  config = function()
    require("cppman").setup()
  end,
}

