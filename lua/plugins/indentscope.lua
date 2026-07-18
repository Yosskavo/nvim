return {
  "echasnovski/mini.indentscope",
  version = false,
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    symbol = "│",
    options = { try_as_border = true },
  },
  config = function(_, opts) require("config.indentscope")(_, opts) end,
}
