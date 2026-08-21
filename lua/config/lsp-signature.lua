-- lua/config/lsp-signature.lua
return function(_, opts)
  require("lsp_signature").setup({
    bind = true,
    handler_opts = {
      border = "rounded",
    },
    floating_window = true, -- Shows the parameter popup window while typing
    floating_window_above_cur_line = true,
    floating_window_off_x = 1,
    floating_window_off_y = 0,
    fix_pos = false,
    hint_enable = true, -- Inline virtual hint
    hint_prefix = "󰮰 ",
    hint_scheme = "String",
    hi_parameter = "LspSignatureActiveParameter", -- Highlights the active argument in bold
    always_trigger = true,
    auto_close_after = nil,
    extra_trigger_chars = { "(", "," },
  })
end
