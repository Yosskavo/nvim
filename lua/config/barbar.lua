local M = {}

function M.setup()
	vim.g.barbar_auto_setup = false
	require("barbar").setup({
		animation = true,
		no_name_title = "Unknown",
		auto_hide = false,
		tabpages = true,
		clickable = true,
		highlight_alternate = false,
		focus_on_close = 'previous',
		hide = {
			extensions = true,
			inactive = false,
		},
		icons =
		{
			button = '',
			pinned =
			{
				button = " ",
				filename = true,
			},
			modified =
			{
				button = " "
			},
			diagnostics = {
				[vim.diagnostic.severity.ERROR] = {enabled = true, icon = ' '},
				[vim.diagnostic.severity.WARN] = {enabled = true, icon = " "},
				[vim.diagnostic.severity.INFO] = {enabled = true, icon = " "},
				[vim.diagnostic.severity.HINT] = {enabled = true, icon = "󱩒 "},
			},
			gitsigns = {
				added = {enabled = true, icon = ' '},
				changed = {enabled = true, icon = '󱖫 '},
				deleted = {enabled = true, icon = ' '},
			},
			filetype = {
				custom_color = false,
				enabled = true,
			},
		},
	})
end

return M
