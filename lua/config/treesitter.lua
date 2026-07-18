-- lua/config/treesitter.lua
return function(_, opts)
  require("nvim-treesitter").setup(opts)
  vim.treesitter.language.register("bash", "zsh")
end
