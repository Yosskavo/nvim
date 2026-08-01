return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  opts = {
    ensure_installed = { "c", "cpp", "lua", "bash", "markdown", "markdown_inline", "vim", "vimdoc", "python" },
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts) require("config.treesitter")(_, opts) end,
}


