local ui = require("core.theme.ui_mode")
local colors = ui.mode_colors

-- Create an augroup so we don't duplicate listeners
local border_group = vim.api.nvim_create_augroup("FloatBorderModeColor", { clear = true })

vim.api.nvim_create_autocmd("ModeChanged", {
    group = border_group,
    pattern = "*:*", -- Trigger on any mode change
    callback = function()
		local mode = vim.api.nvim_get_mode().mode
        local color = colors[mode] or colors['n'] -- Default to Normal color
        -- Update the FloatBorder highlight
        vim.api.nvim_set_hl(0, "FloatBorder", { fg = color, bg = "NONE", force = true })
        -- Optional: If you want Oil or ToggleTerm to have a specific title color
        vim.api.nvim_set_hl(0, "FloatTitle", { fg = color, bold = true, force = true })
		vim.cmd("redraw")
    end,
})
