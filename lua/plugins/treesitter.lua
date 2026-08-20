return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,
  opts = {
    ensure_installed = {
      "c", "cpp", "lua", "bash", "markdown", "markdown_inline", "vim", "vimdoc", "python", "regex",
      -- Go
      "go", "gomod", "gowork", "gosum",
      -- Odin
      "odin",
      -- Web / Docs
      "html", "css",
      -- DevOps / Infrastructure
      "dockerfile", "yaml", "json", "terraform", "hcl", "toml", "make"
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts) require("config.treesitter")(_, opts) end,
}


