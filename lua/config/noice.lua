local M ={}

-- NOTE: i want custom highlight icons and also lets make new modes {command, shell, search, help} modes
-- NOTE: use notify or nui to output the messages error or some
-- NOTE: add the man and help using nui to help ppl in work




-- fg is the border/text color, bg is the background (use "NONE" for transparent)
vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "FloatBorder" })
function M.setup()
  require("noice").setup({
	cmdline = {
		format = {
		  -- Change the icon for the standard ":" command
		  cmdline = { pattern = "^:", icon = " ", lang = "vim" },
		  -- Change the icon for search "/"
		  search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
		  -- Change the icon for search "?"
		  search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
		  -- Change the icon for shell commands ":"
		  filter = { pattern = "^:%s*!", icon = " ", lang = "zsh" },
		},
	messages = {
		-- NOTE: If you enable messages, then the cmdline is enabled automatically.
		-- This is a current Neovim limitation.
		enabled = true, -- enables the Noice messages UI
		view = "notify", -- default view for messages
		view_error = "notify", -- view for errors
		view_warn = "notify", -- view for warnings
		view_history = "messages", -- view for :messages
		view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
	},
	  },
    views = {
      cmdline_popup = {
        position = {
          row = 5,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
		border =
		{
          style = "rounded",
          padding = { 0, 1 },
		},
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "NoiceCmdlinePopupBorder" },
        },
      },
      popupmenu = {
        relative = "editor",
        position = {
          row = 8,
          col = "50%",
        },
        size = {
          width = 60,
          height = 10,
        },
        border = {
          style = "rounded",
          padding = { 0, 1 },
        },
        win_options = {
          winhighlight = { Normal = "Normal", FloatBorder = "FloatBorder" },
        },
      },
    },
  })
end

return M
