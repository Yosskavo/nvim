-- ==========================================
-- 🌌 TRANSPARENCY CONFIGURATION & :TP COMMAND
-- ==========================================

local function set_transparency(enable)
  vim.g.transparent_enabled = enable

  local ok, transparent = pcall(require, "transparent")
  if ok and transparent and transparent.toggle then
    transparent.toggle(enable)
  else
    local cs = vim.g.colors_name or "default"
    pcall(vim.cmd.colorscheme, cs)
    if enable then
      local groups = {
        "Normal", "NormalNC", "SignColumn", "NormalFloat", "FloatBorder",
        "TelescopeNormal", "TelescopeBorder", "NvimTreeNormal", "NvimTreeNormalNC",
        "WhichKeyFloat", "BufferLineFill", "BufferLineBackground"
      }
      for _, g in ipairs(groups) do
        vim.cmd("highlight " .. g .. " ctermbg=NONE guibg=NONE")
      end
    end
  end
end

-- User command :TP [on|off|toggle|enable|disable]
vim.api.nvim_create_user_command("TP", function(opts)
  local cmd_arg = tostring(opts.args or ""):lower():gsub("%s+", "")
  local current = vim.g.transparent_enabled == true
  local new_state

  if cmd_arg == "on" or cmd_arg == "enable" or cmd_arg == "1" or cmd_arg == "true" then
    new_state = true
  elseif cmd_arg == "off" or cmd_arg == "disable" or cmd_arg == "0" or cmd_arg == "false" then
    new_state = false
  else
    new_state = not current
  end

  set_transparency(new_state)
  local status_str = new_state and "ENABLED (Transparent)" or "DISABLED (Solid Background)"
  vim.notify("Neovim Transparency: " .. status_str, vim.log.levels.INFO, { title = "Transparency" })
end, {
  nargs = "?",
  complete = function()
    return { "on", "off", "toggle", "enable", "disable" }
  end,
  desc = "Toggle or set Neovim background transparency",
})
