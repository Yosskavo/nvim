return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  keys = {
    {
      "<leader>sr",
      function()
        local grug = require("grug-far")
        local ext = vim.bo.filetype ~= "" and vim.fn.expand("%:e") or nil
        grug.open({
          transient = true,
          prefills = {
            filesFilter = ext and ext ~= "" and ("*." .. ext) or nil,
          },
        })
      end,
      mode = { "n", "v" },
      desc = "Search and Replace (grug-far)",
    },
  },
  opts = { headerMaxWidth = 80 },
}

