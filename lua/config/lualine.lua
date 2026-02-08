local M = {}


function M.setup()
    require("lualine").setup({ -- Added parenthesis here
        options = {
            component_separators = { left = '|', right = '|'},
            section_separators = { left = '', right = ''},
            icons_enabled = true,
            globalstatus = true,
			disabled_filetypes = {
				-- statusline = {"dashboard"}, -- Hides it on the dashboard
				-- winbar = {"dashboard",},
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
