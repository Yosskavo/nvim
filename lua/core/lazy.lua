-- this is for lazy vim plugin
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)


local data_path = vim.fn.stdpath("data")
local switcheroo_file = data_path .. "/SelectedTheme" -- Or "/switcheroo.json" depending on your fork

local function get_initial_theme()
  local file = io.open(switcheroo_file, "r")
  if file then
    file:close()
    -- Switcheroo's save file exists; let it load the theme automatically
    return nil
  else
    -- FIRST INSTALL: No file exists yet, safe to force your pristine default choice
    return "shekai" -- Change this to whatever colorscheme name you want first
  end
end

local initial_theme = get_initial_theme()



require("lazy").setup({
	opts =
	{
		autocmds = false,
		keymaps = false,
		colorscheme = initial_theme,

	},
	spec = {
		-- add LazyVim and import its plugins
		-- { "LazyVim/LazyVim" },
		-- import/override with your plugins
		{ import = "plugins"},
		{ import = "theme"},
	},
	defaults = {
		-- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
		-- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
		lazy = false,
		-- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
		-- have outdated releases, which may break your Neovim install.
		version = false, -- always use the latest git commit
		-- version = "*", -- try installing the latest stable version for plugins that support semver
	},
	-- install = { colorscheme = { "tokyonight"} },
	-- install = {colorscheme = {"tokyonight"}},
	checker = {
		enabled = false, -- check for plugin updates periodically
		notify = false, -- notify on update
	}, -- automatically check for plugin updates
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},

		},
	},
ui = {
    size = { width = 0.8, height = 0.5 },
    wrap = false,
    border = "rounded",
    title = " Plugin Manager ",
    title_pos = "center",
    icons = {
      cmd = " ",
      config = "🛠",
      event = " ",
      ft = "󰝰 ",
      init = "⚙ ",
      keys = "🗝 ",
      plugin = "󰚥 ",
      runtime = " ",
      require = " ",
      source = " ",
      start = " ",
      task = " ",
      lazy = "󰏖 ",
    },
  },
})
