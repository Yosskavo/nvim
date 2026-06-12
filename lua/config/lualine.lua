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
					fmt = function(str)
					  -- Check if the current buffer's filetype is a toggleterm
					  if vim.bo.filetype == "toggleterm" then
						return " Terminal" -- You can remove the icon if you just want text
					 elseif vim.bo.filetype == "neo-tree" then
					 	return "Neo-tree"
					 elseif vim.bo.filetype == "oil" then
					 	return "Oil"
					  end
					  -- If it's a normal file, just return the normal filename
					  return str
					end,
                    file_status = true,
					newfile_status = true,
                    path = 0,
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
					'searchcount',
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
				},
				{
					'selectioncount'
				}
			},
			-- lualine_z = {'username'},
        },
    })
end

return M
