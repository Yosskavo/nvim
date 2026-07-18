return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  priority = 1000,
  config = function(_, opts) require("config.lsp-signature")(_, opts) end,
}
