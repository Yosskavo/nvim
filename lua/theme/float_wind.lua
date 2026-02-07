return function()
	local ui = require("core.theme.ui_mode")
	local l_bg = "NONE"
	local colors = ui.mode_colors

	-- Create an augroup so we don't duplicate listeners
	local border_group = vim.api.nvim_create_augroup("FloatBorderModeColor", { clear = true })


	local mode = vim.api.nvim_get_mode().mode
	local color = colors[mode] or colors['n'] -- Default to Normal color

	vim.api.nvim_set_hl(0, "WinSeparator", { fg = color, bg = l_bg , force = true })
	-- Update the FloatBorder highlight
	vim.api.nvim_set_hl(0, "LazyGitBorder", { fg = color, bg = l_bg , force = true })
	vim.api.nvim_set_hl(0, "FloatBorder", { fg = color, bg = l_bg , force = true })
	-- Optional: If you want Oil or ToggleTerm to have a specific title color
	vim.api.nvim_set_hl(0, "FloatTitle", { fg = color, bg = l_bg, bold = true, force = true })


	vim.api.nvim_create_autocmd("ModeChanged", {
		group = border_group,
		pattern = "*:*", -- Trigger on any mode change
		callback = function()
			mode = vim.api.nvim_get_mode().mode
			color = colors[mode] or colors['n'] -- Default to Normal color
			vim.api.nvim_set_hl(0, "WinSeparator", { fg = color, bg = l_bg , force = true })
			-- Update the FloatBorder highlight
			vim.api.nvim_set_hl(0, "LazyGitBorder", { fg = color, bg = l_bg , force = true })
			vim.api.nvim_set_hl(0, "FloatBorder", { fg = color, bg = l_bg , force = true })
			-- Optional: If you want Oil or ToggleTerm to have a specific title color
			vim.api.nvim_set_hl(0, "FloatTitle", { fg = color, bg = l_bg, bold = true, force = true })
			vim.cmd("redraw")
		end,
	})
end


