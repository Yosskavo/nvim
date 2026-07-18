local M = {}



-- 1. Store your different header options here
local headers = {
	{
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"¿",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
		"",
	},
  -- Header Option 1 (Your current logo)
  {
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
  },
-- Add this block to your headers table in dashboard.lua
  {
	[[]],
	[[]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣺⣿⣿⣿⣿⣿⣻⣿⣿⣿⣶⡄⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣷⡀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⢀⣼⣿⣿⣿⣿⣿⣿⡟⢿⡿⣍⣼⣧⣷⣿⣷⣄⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⢀⢎⣹⣿⣍⡿⣿⣗⣾⢺⣾⣾⣿⣾⣿⣻⣟⣿⣯⣢⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠈⠙⢹⣿⣿⢿⡿⣿⡼⣶⣻⣿⣿⣿⣿⣿⣿⣿⡏⠏⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠙⠻⣿⡉⠛⠗⠈⠁⠈⣿⣿⣿⣿⣿⡏⠁⠒⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⢀⠄⠂⣿⣧⡀⠀⠀⠀⠀⢠⣿⣿⣿⠛⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠈⠀⠀⠘⣿⠿⣿⣦⡀⢀⣔⣻⠽⣿⣿⣶⠀⠀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡡⠬⢿⣿⡥⢽⣿⠿⠘⢉⠴⢿⣔⡀⠀⠀⠀⠀⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⢀⠎⠀⠀⢀⠏⢰⠋⠉⢀⡉⢁⣴⣾⠍⠛⠉⠉⠐⠄⠀]],
    [[⠀⠀⠀⠀⠀⠀⠀⠀⣾⣗⢰⠁⡆⣠⣗⣂⡡⢁⣴⡿⠡⣴⡑⡄⠀⠀⠐⠘⡄]],
    [[⠠⠴⢾⠿⠷⠀⢀⣥⣿⡿⠃⡼⢹⢜⠲⣡⡴⡻⠊⡀⢆⣿⣷⡄⠀⠀⠀⣰⡇]],
    [[⠀⠀⠀⠀⢀⣰⣿⡩⠋⠀⡰⠠⣊⣱⢞⠕⠈⠀⠀⠈⢸⣿⣿⣷⠀⠀⢀⣿⡇]],
    [[⠀⠀⠀⠀⢸⣿⡟⠀⠀⠈⠈⠐⠒⠈⠀⠀⠀⡀⠸⠀⣸⣿⣿⣿⢠⡄⣾⣿⠁]],
    [[⠀⠀⠀⢀⢾⠨⣿⣦⣄⣀⣀⣀⣀⠀⠀⠈⠀⠀⠂⣤⣿⣿⣿⣿⣶⣧⠟⠁⠀]],
    [[⠀⠀⣰⡟⠀⠑⢮⣻⣿⣿⣿⣿⣿⣿⣷⣶⣶⣾⣾⣿⣿⣿⠿⣿⡿⠃⠀⠀⠀]],
    [[⠀⠠⣿⣿⣤⡀⠀⡿⣝⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠠⡟⠁⠀⠀⠀⠀]],
	[[]],
	[[]],
  },
-- -- Add this block to your headers table in dashboard.lua
--   {
--     [[░▒▓███████▓▒░       ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓██████████████▓▒░  ]],
--     [[░▒▓█▓▒░░▒▓█▓▒░       ░▒▓█▓▒░░▒▓█▓▒░      ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ]],
--     [[░▒▓█▓▒░░▒▓█▓▒░        ░▒▓█▓▒▒▓█▓▒░       ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ]],
--     [[░▒▓█▓▒░░▒▓█▓▒░        ░▒▓█▓▒▒▓█▓▒░       ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ]],
--     [[░▒▓█▓▒░░▒▓█▓▒░         ░▒▓█▓▓█▓▒░        ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ]],
--     [[░▒▓█▓▒░░▒▓█▓▒░         ░▒▓█▓▓█▓▒░        ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ]],
--     [[░▒▓█▓▒░░▒▓█▓▒░          ░▒▓██▓▒░         ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░░▒▓█▓▒░ ]],
--   },
	{

		" ",
		" ",
		" ",
		" ",
		[[                                                                       ]],
		[[  ██████   █████                   █████   █████  ███                  ]],
		[[ ░░██████ ░░███                   ░░███   ░░███  ░░░                   ]],
		[[  ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   ]],
		[[  ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  ]],
		[[  ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  ]],
		[[  ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  ]],
		[[  █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ ]],
		[[ ░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  ]],
		[[                                                                       ]],
		" ",
		" ",
		" ",
		" ",
	},
}

function M.setup()
    -- 2. Seed the random generator using current epoch time
    math.randomseed(os.time())
    -- 3. Grab a random index pointing into the headers table
    local random_index = math.random(1, #headers)
    local chosen_header = headers[random_index]

    require("dashboard").setup({
            theme = "doom",
            shortcut_type = "letter",
            shuffle_letter = false,
            change_to_vcs_root = true,
            preview = {},
            config = {
                -- 4. Inject the randomized header here
                header = chosen_header, 
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
						icon = '󰚰  ',
						desc = 'Update config         ',
						key = 'i',
						key_format = ' [%s]',
						action = 'InvertedUpdate',
					},
					{
						icon = '󱂷  ',
						desc = 'about the config     ',
						key = 'a',
						key_format = ' [%s]',
						action = 'e ~/.config/nvim/README.md',
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
                footer =
				{
					"You can change theme by <A-t>",
					"Am Workin On Dyin",
					" ", -- Adds a clean blank line separator
                    "  " .. os.date("%A, %B %d, %Y — %I:%M %p") -- Outputs: Sunday, May 17, 2026 — 08:46 PM}
        		}
		}
    })
end

return M
