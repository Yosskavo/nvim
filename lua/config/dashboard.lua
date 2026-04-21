local M = {}

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
					},
					{
						icon = '󰏖  ',
						desc = 'Lazy           ',
						key = 'l',
						key_format = ' [%s]',
						action = 'Lazy',
					},
					{
						icon = '󰱼  ',
						desc = 'Find Files           ',
						key = 'f',
						key_format = ' [%s]',
						action = 'Telescope find_files',
					},
					{
						icon = "  ",
						desc = "Lazy Git     ",
						key = 'g',
						key_format = " [%s]",
						action = "LazyGit",
					},
					{
						icon = '  ',
						desc = 'New Project           ',
						key = 'p',
						key_format = ' [%s]',
						action = 'NewProject',
					},

					{
						icon = '  ',
						desc = 'config           ',
						key = 'c',
						key_format = ' [%s]',
						action = 'cd ~/.config/nvim | Telescope find_files',
					},
					{
						icon = '  ',
						desc = 'Quit           ',
						key = 'q',
						key_format = ' [%s]',
						action = 'q',
					},
				},
				vertical_center = false,
				footer = {"Am Workin On Dyin"}
		}
	})
end

return M
