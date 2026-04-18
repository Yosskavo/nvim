local M = {}

function M.setup()
  require("bufferline").setup({
    options = {
		separator_style = { '', '' },
      mode = "buffers",
      -- This matches your Barbar 'focus_on_close' behavior
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      -- CLEAN FILENAMES (No long paths)
      -- Setting this to 'none' stops showing folder paths for same-named files
      duplicate_symbols = {
        ancestor = "none",
      },

      -- Matching your Barbar 'hide.extensions'
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = false,
      show_tab_indicators = true,

      -- Matching your Barbar diagnostic icons
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local s = " "
        for e, n in pairs(diagnostics_dict) do
          local sym = e == "error" and " "
            or (e == "warning" and " " or " ")
          s = s .. n .. sym
        end
        return s
      end,

      -- Indicator icons (your button = '' and modified = '')
      buffer_close_icon = '',
      modified_icon = ' ',
      close_icon = '',
      left_trunc_marker = '',
      right_trunc_marker = '',

      -- Offset for Oil.nvim (so the line starts after the file explorer)
      offsets = {
        {
          filetype = "oil",
          text = "File Explorer",
          text_align = "left",
          separator = true,
        }
      },
    },
  })
end

return M
