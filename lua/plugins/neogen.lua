return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  cmd = "Neogen",
  keys = {
    { "<leader>dg", function() require("neogen").generate() end, desc = "Generate Doc (Neogen)" },
    { "<leader>nf", function() require("neogen").generate({ type = "func" }) end, desc = "Generate Function Doc" },
    { "<leader>nc", function() require("neogen").generate({ type = "class" }) end, desc = "Generate Class Doc" },
    { "<leader>nt", function() require("neogen").generate({ type = "type" }) end, desc = "Generate Type Doc" },
    { "<leader>nF", function() require("neogen").generate({ type = "file" }) end, desc = "Generate File Doc" },
  },
  opts = {
    snippet_engine = "luasnip",
    languages = {
      c = { template = { annotation_convention = "doxygen" } },
      cpp = { template = { annotation_convention = "doxygen" } },
      python = { template = { annotation_convention = "google" } },
    },
  },
}

