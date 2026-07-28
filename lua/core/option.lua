-- this is to turn on the teminal color
vim.opt.termguicolors = true

-- the characters in the places that unwrighted
vim.opt.fillchars = { eob = " " }

-- clip board
vim.opt.clipboard = "unnamedplus"

-- for tabs
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = false

-- this for the numbers in the side
vim.opt.number = true
vim.opt.relativenumber = true

-- for spelling
vim.opt.spell = true
vim.opt.spelllang = "en_us"

-- this is for line hightlight
vim.opt.cursorline = true

-- change the leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- this to turn off the swap files
vim.opt.swapfile = false

-- to show how much line*coloums you select in the visual mode
vim.opt.showcmd = true

-- this is for aligned the start
vim.opt.signcolumn = "yes:1"

-- this is for statusline to be global in all window's
vim.opt.laststatus = 3

-- this is for history undo file
vim.opt.undofile = true

-- this is for the theme's
vim.lsp.semantic_tokens.enable = false

-- Sets the delay for CursorHold (and swap file writing) to 250ms
vim.opt.updatetime = 0

-- this is for characters
vim.opt.nrformats:append("alpha")

-- for the cursor
vim.opt.guicursor = "n-v-c:block-Cursor,i-ci-ve:ver25-Cursor,r-cr:hor20,o:hor50"

-- Turn OFF the hardcoded Neovim default [1/1]
vim.opt.shortmess:append("c")

-- Allow the cursor to move into empty space in Visual Block mode
vim.opt.virtualedit = "block"
vim.deprecate = function() end

-- ==========================================
-- 🌌 TRANSPARENCY CONFIGURATION & :TP COMMAND
-- ==========================================
vim.g.transparent_enabled = true
vim.g.tokyonight_transparent = true
vim.g.catppuccin_transparent_background = true
vim.g.transparent_background = true

local transparent_groups = {
    "Normal", "NormalNC", "SignColumn", "NormalFloat", "FloatBorder",
    "TelescopeNormal", "TelescopeBorder", "NvimTreeNormal", "NvimTreeNormalNC"
}

local function apply_transparency(enable)
    vim.g.transparent_enabled = enable
    if enable then
        for _, g in ipairs(transparent_groups) do
            vim.cmd("highlight " .. g .. " ctermbg=NONE guibg=NONE")
        end
    else
        local cs = vim.g.colors_name or "default"
        vim.cmd("colorscheme " .. cs)
    end
end

-- Auto-apply transparency whenever a colorscheme is loaded
vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function()
        if vim.g.transparent_enabled then
            apply_transparency(true)
        end
    end,
})

-- User command :TP [on|off|toggle]
vim.api.nvim_create_user_command("TP", function(opts)
    local cmd_arg = tostring(opts.args or ""):lower()
    if cmd_arg == "on" or cmd_arg == "enable" then
        apply_transparency(true)
        vim.notify("Neovim Transparency: ON", vim.log.levels.INFO)
    elseif cmd_arg == "off" or cmd_arg == "disable" then
        apply_transparency(false)
        vim.notify("Neovim Transparency: OFF", vim.log.levels.INFO)
    else
        apply_transparency(not vim.g.transparent_enabled)
        local status = vim.g.transparent_enabled and "ON" or "OFF"
        vim.notify("Neovim Transparency: " .. status, vim.log.levels.INFO)
    end
end, {
    nargs = "?",
    complete = function()
        return { "on", "off", "toggle" }
    end,
})

-- Initial application on startup
apply_transparency(true)
