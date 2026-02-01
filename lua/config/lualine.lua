local M = {}

local colors = {
  bg       = '#1a1b26', -- Deep background
  fg       = '#cfc9c2', -- Light text
  yellow   = '#e0af68',
  cyan     = '#7dcfff',
  green    = '#9ece6a', -- The green from your terminal border
  orange   = '#ff9e64',
  violet   = '#bb9af7',
  magenta  = '#bb9af7',
  blue     = '#7aa2f7', -- The blue from your FloatTitle
  red      = '#f7768e',
  gray     = '#3b4261',
  darkgray = '#16161e',
}

local tokyonight_theme = {
  normal = {
    a = { bg = colors.blue, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.gray, fg = colors.blue },
    c = { bg = colors.darkgray, fg = colors.blue },
  },
  insert = {
    a = { bg = colors.green, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.gray, fg = colors.green },
    c = { bg = colors.darkgray, fg = colors.green },
  },
  visual = {
    a = { bg = colors.magenta, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.gray, fg = colors.magenta },
    c = { bg = colors.darkgray, fg = colors.magenta },
  },
  replace = {
    a = { bg = colors.red, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.gray, fg = colors.red },
    c = { bg = colors.darkgray, fg = colors.red },
  },
  command = {
    a = { bg = colors.orange, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.gray, fg = colors.orange },
    c = { bg = colors.darkgray, fg = colors.orange },
  },
  inactive = {
    a = { bg = colors.darkgray, fg = colors.gray, gui = 'bold' },
    b = { bg = colors.darkgray, fg = colors.darkgray },
    c = { bg = colors.darkgray, fg = colors.darkgray },
  },
	terminal = {
    a = { bg = colors.green, fg = colors.bg, gui = 'bold' },
    b = { bg = colors.gray, fg = colors.green },
    c = { bg = colors.darkgray, fg = colors.green },
  },
}

function M.setup()
	require("lualine").setup
	{
		options =
		{
			component_separators = { left = '|', right = '|'},
			section_separators = { left = '', right = ''},
			icons_enabled = true,
			theme = tokyonight_theme,
			globalstatus = true,
		},
		sections = {
			lualine_b = {
			  {
				'branch',
				icon = '',
				color = { fg = colors.violet, gui = 'bold' },
			  },
			},
			lualine_c = {
			  {
				'filename',
				file_status = true,
				path = 1,
				symbols = {
				  modified = "󱇨 ",      -- The icon you'll see when unsaved
				  readonly = "󱀰 ",      -- The icon for protected files
				  unnamed = " ",
				  newfile = " ",
				},
				-- This is where you define the colors for the text/symbols
				color = function()
					if vim.fn.filereadable(vim.fn.expand("%")) == 0 then
						return {fg = colors.green}
					elseif vim.fn.expand("%") == "" then
						return {fg = colors.magenta}
					elseif vim.bo.modified then
					return { fg = '#ff9e64', gui = 'bold' } -- Orange if changed
				  elseif vim.bo.readonly then
					return { fg = '#f7768e' }              -- Red if locked
				  end
				  return { fg = '#7aa2f7' }                -- Blue if normal
				end,
			  }
			}
		},
	}
end

return M
