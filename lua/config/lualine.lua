local M = {}

local m_colors = require("core.theme.ui_mode").mode_colors
local colors = require("core.theme.colors").my_colors

local tokyonight_theme = {
  normal = {
    a = { bg = m_colors.n, fg = colors.bg_alt, gui = 'bold' },
    b = { bg = colors.bg_alt, fg = colors.blue },
    c = { bg = colors.bg_alt, fg = colors.blue },
  },
  insert = {
    a = { bg = m_colors.i, fg = colors.bg_alt, gui = 'bold' },
    b = { bg = colors.bg_alt, fg = colors.green },
    c = { bg = colors.bg_alt, fg = colors.green },
  },
  visual = {
    a = { bg = m_colors.v, fg = colors.bg_alt, gui = 'bold' },
    b = { bg = colors.bg_alt, fg = colors.magenta },
    c = { bg = colors.bg_alt, fg = colors.magenta },
  },
  replace = {
    a = { bg = m_colors.R, fg = colors.bg_alt, gui = 'bold' },
    b = { bg = colors.bg_alt, fg = colors.red },
    c = { bg = colors.bg_alt, fg = colors.red },
  },
  command = {
    a = { bg = m_colors.c, fg = colors.bg_alt, gui = 'bold' },
    b = { bg = colors.bg_alt, fg = colors.orange },
    c = { bg = colors.bg_alt, fg = colors.orange },
  },
  -- inactive = {
  --   a = { bg = colors.bg_alt, fg = colors.gray, gui = 'bold' },
  --   b = { bg = colors.bg_alt, fg = colors.bg_alt },
  --   c = { bg = colors.bg_alt, fg = colors.bg_alt },
  -- },
  select = {
    a = { bg = m_colors.s, fg = colors.bg_alt, gui = 'bold' },
    b = { bg = colors.bg_alt, fg = colors.green_lime },
    c = { bg = colors.bg_alt, fg = colors.green_lime },
  },
  terminal = {
    a = { bg = m_colors.t, fg = colors.bg_alt, gui = 'bold' },
    b = { bg = colors.bg_alt, fg = colors.green_lime },
    c = { bg = colors.bg_alt, fg = colors.green_lime },
  },
}

function M.setup()
    require("lualine").setup({ -- Added parenthesis here
        options = {
            component_separators = { left = '|', right = '|'},
            section_separators = { left = '', right = ''},
            icons_enabled = true,
            theme = tokyonight_theme,
            globalstatus = true,
			disabled_filetypes = {
				statusline = {"dashboard"}, -- Hides it on the dashboard
				winbar = {"dashboard",},
			},
        },
        sections = {
            lualine_a = {
                {
                    'mode',
                },
            },
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
                        modified = "󱇨 ",
                        readonly = "󱀰 ",
                        unnamed = " ",
                        newfile = " ",
                    },
                    color = function()
                        -- Improved logic for file status colors
                        if vim.bo.modified then
                            return { fg = colors.orange, gui = 'bold' }
                        elseif vim.bo.readonly then
                            return { fg = colors.red }
                        elseif vim.fn.expand("%") == "" then
                            return { fg = colors.magenta }
                        end
                        return { fg = colors.blue }
                    end,
                }
            },
			lualine_z =
			{
				{
					'searchcount'
				}
			},
			lualine_y =
			{
				{
					'diff',
					symbols =
					{
						added = ' ',
						modified = ' ',
						removed = ' '
					},
				}
			},
			lualine_x =
			{
				{
					'filetype',
					colored = true,
					icon_only = true,
				}
			},
			-- lualine_z = {'username'},
        },
    })
end

return M
