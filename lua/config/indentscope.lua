-- lua/config/indentscope.lua
return function(_, opts)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help", "alpha", "dashboard", "oil", "neo-tree", "Trouble", "lazy", "mason" },
    callback = function()
      vim.b.miniindentscope_disable = true
    end,
  })
  require("mini.indentscope").setup(opts)
end
