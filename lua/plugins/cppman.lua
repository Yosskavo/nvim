return {
  "madskjeldgaard/cppman.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = { "CPPMan" },
  keys = {
    {
      "<leader>cm",
      function() require("cppman").open_cppman_for(vim.fn.expand("<cword>")) end,
      desc = "CPPMan (word under cursor)",
    },
    {
      "<leader>cM",
      function() require("cppman").input() end,
      desc = "CPPMan Search",
    },
  },
  config = function()
    require("cppman").setup()
  end,
}

