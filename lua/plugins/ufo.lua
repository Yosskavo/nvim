return {
  "kevinhwang91/nvim-ufo",
  event = "BufRead",
  config = function(_, opts) require("config.ufo")(_, opts) end,
}
