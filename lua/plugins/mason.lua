return {
  "williamboman/mason.nvim",
  lazy = false,
  enabled = true,
  config = function()
    require("config.mason").setup()
  end,
}

