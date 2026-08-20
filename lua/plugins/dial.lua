return {
  "monaqa/dial.nvim",
  event = "VeryLazy",
  config = function(_, opts) require("config.dial")(_, opts) end,
}
