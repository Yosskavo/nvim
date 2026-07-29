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
