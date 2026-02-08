return {
  "dnlhc/glance.nvim",
  config = function()
    require('glance').setup({
      -- Custom border to match your Cyan theme
      border = { enable = true, top_char = '―', bottom_char = '―' },
    })
    -- Map it to your hover or definition key
    vim.keymap.set('n', 'gK', '<CMD>Glance definitions<CR>')
  end,
}
