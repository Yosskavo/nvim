return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  -- Use "opts" instead of "config = function() require('nvim-treesitter.configs').setup(...) end"
  opts = {
    -- Make sure "bash" is here, and REMOVE "zsh"
    ensure_installed = { "c", "cpp", "lua", "bash", "markdown", "markdown_inline", "vim", "vimdoc" },
    highlight = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    -- This handles the configuration automatically without needing the old module
    require("nvim-treesitter").setup(opts)

    -- Tell Neovim to use the bash parser whenever you open a zsh file
    vim.treesitter.language.register("bash", "zsh")
  end,
}
