return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true, -- Uses Treesitter to be smarter
      disable_filetype = { "TelescopePrompt" },
    })
  end
}
