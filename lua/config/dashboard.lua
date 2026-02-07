local M = {}
local colors = require("core.theme.colors").my_colors

-- this for genaral color
vim.api.nvim_set_hl(0, "DashDescHl", {fg = colors.fg_muted, italic = true, bold = true})

-- this for new file
vim.api.nvim_set_hl(0, "DashIconFileHl", {fg = colors.green_deep})
vim.api.nvim_set_hl(0, "DashKeyFileHl", {fg = colors.green_main, bold = true})

-- this for git color's
vim.api.nvim_set_hl(0, "DashIconGitHl", {fg = colors.orange})
vim.api.nvim_set_hl(0, "DashKeyGitHl", {fg = colors.orange, bold = true})

-- this for quit color's
vim.api.nvim_set_hl(0, "DashIconQuitHl", {fg = colors.red})
vim.api.nvim_set_hl(0, "DashKeyQuitHl", {fg = colors.red, bold = true})

-- this for lazy color's
vim.api.nvim_set_hl(0, "DashIconConfHl", {fg = colors.amber_soft })
vim.api.nvim_set_hl(0, "DashKeyConfHl", {fg = colors.peach_light , bold = true})

-- this for lazy color's
vim.api.nvim_set_hl(0, "DashIconLazyHl", {fg = colors.blue_accent })
vim.api.nvim_set_hl(0, "DashKeyLazyHl", {fg = colors.blue_accent , bold = true})

-- this for telescope color's
vim.api.nvim_set_hl(0, "DashIconTeleHl", {fg = colors.lavender_ink})
vim.api.nvim_set_hl(0, "DashKeyTeleHl", {fg = colors.violet_glow, bold = true})

function M.setup()
	require("dashboard").setup({
			theme = "doom",
			shortcut_type = "letter",
			shuffle_letter = false,
			change_to_vcs_root = true,
			preview = {},
			config = {
				header = {
					" ",
					" ",
					" ",
					" ",
					"                   ▄                  ",
					"                ▟█▙                 ",
					"                 ▟███▙                ",
					"              ▟█████▙               ",
					"               ▟███████▙              ",
					"             ▔▀▜██████▙             ",
					"             ▟██▅▂▝▜█████▙            ",
					"          ▟█████████████▙           ",
					"           ▟███████████████▙          ",
					"        ▟█████████████████▙         ",
					"         ▟███████████████████▙        ",
					"      ▟█████████▛▀▀▜████████▙       ",
					"       ▟████████▛     ▜███████▙      ",
					"    ▟█████████         ████████▙     ",
					"     ▟██████████        █████▆▅▄▃▂    ",
					"  ▟██████████▛         ▜█████████▙   ",
					"   ▟██████▀▀▀             ▀ ▀██████▙  ",
					"▟███▀▘                      ▝▀███▙ ",
					" ▟▛▀                              ▀▜▙",
					" ",
					" ",
					" ",
					" ",
				}, -- Your custom logo
				center = {
					{
						icon = '󰝒  ',
						desc = 'New File           ',
						key = 'n',
						key_format = ' [%s]',
						action = 'enew',
						icon_hl = "DashIconFileHl",
						key_hl = "DashKeyFileHl",
						desc_hl = "DashDescHl"
					},
					{
						icon = '󰏖  ',
						desc = 'Lazy           ',
						key = 'l',
						key_format = ' [%s]',
						action = 'Lazy',
						icon_hl = "DashIconLazyHl",
						key_hl = "DashKeyLazyHl",
						desc_hl = "DashDescHl"
					},
					{
						icon = '󰱼  ',
						desc = 'Find Files           ',
						key = 'f',
						key_format = ' [%s]',
						action = 'Telescope find_files',
						icon_hl = "DashIconTeleHl",
						key_hl = "DashKeyTeleHl",
						desc_hl = "DashDescHl"
					},
					{
						icon = "  ",
						desc = "Lazy Git     ",
						key = 'g',
						key_format = " [%s]",
						action = "LazyGit",
						icon_hl = "DashIconGitHl",
						key_hl = "DashKeyGitHl",
						desc_hl = "DashDescHl"
					},
					{
						icon = '  ',
						desc = 'config           ',
						key = 'c',
						key_format = ' [%s]',
						action = 'cd ~/.config/nvim | Telescope find_files',
						icon_hl = "DashIconConfHl",
						key_hl = "DashKeyConfHl",
						desc_hl = "DashDescHl"
					},
					{
						icon = '  ',
						desc = 'Quit           ',
						key = 'q',
						key_format = ' [%s]',
						action = 'q',
						icon_hl = "DashIconQuitHl",
						key_hl = "DashKeyQuitHl",
						desc_hl = "DashDescHl"
					},
				},
				vertical_center = false,
				footer = {"Am Workin Dyin"}
		}
	})
end

return M
