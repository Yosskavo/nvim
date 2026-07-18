-- lua/config/lsp_signature.lua
return function(_, opts)
  require("lsp_signature").setup({
    bind = true,
    handler_opts = { border = "rounded" },
    hint_inline = function() return "eol" end,
    hint_enable = true,
    hint_prefix = "󰮰 "
  })
end
