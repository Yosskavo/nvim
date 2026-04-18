-- lua/plugins/indentscope.lua
return {
  "echasnovski/mini.indentscope",
  version = false, -- wait till new 0.7.0 release to put it back on semver
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    -- symbol = "▏",
    symbol = "│",
    options = { try_as_border = true },
  },
  config = function(_, opts)
    -- This disables the scope line in specific filetypes like Oil or NvimTree
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "help", "alpha", "dashboard", "oil", "neo-tree", "Trouble", "lazy", "mason" },
      callback = function()
        vim.b.miniindentscope_disable = true
      end,
    })
    require("mini.indentscope").setup(opts)
  end,
}
