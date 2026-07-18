return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  priority = 1000,
  dependencies = {
    "rafamadriz/friendly-snippets",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    {
      "windwp/nvim-autopairs",
      config = function(_, opts) require("config.autopairs")(_, opts) end,
    },
  },
  config = function(_, opts) require("config.cmp")(_, opts) end,
}
