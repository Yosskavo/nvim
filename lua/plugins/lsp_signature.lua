return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  priority = 1000, -- Load before EVERYTHING else
  config = function()
    require("lsp_signature").setup {
      bind = true,
      handler_opts = {
        border = "rounded",  -- 🟠 rounded borders
      },
		hint_inline = function() return "eol" end,
		hint_enable = true,
		hint_prefix = "󰮰 "
    }
  end,
}
