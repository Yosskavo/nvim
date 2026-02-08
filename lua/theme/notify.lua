return function()

local colors = require("core.theme.colors").my_colors

vim.api.nvim_set_hl(0, "NotifyERRORBorder", {bg = colors.bg_alt, fg = colors.red_deep})
vim.api.nvim_set_hl(0, "NotifyWARNBorder", {bg = colors.bg_alt, fg = colors.light_orange})
vim.api.nvim_set_hl(0, "NotifyINFOBorder", {bg = colors.bg_alt, fg = colors.green_deep})
vim.api.nvim_set_hl(0, "NotifyDEBUGBorder", {bg = colors.bg_alt, fg = colors.purple_light})
vim.api.nvim_set_hl(0, "NotifyTRACEBorder", {bg = colors.bg_alt, fg = colors.fg_soft})
vim.api.nvim_set_hl(0, "NotifyERRORIcon", {bg = colors.bg_alt, fg = colors.red})
vim.api.nvim_set_hl(0, "NotifyWARNIcon", {bg = colors.bg_alt, fg = colors.light_yellow})
vim.api.nvim_set_hl(0, "NotifyINFOIcon", {bg = colors.bg_alt, fg = colors.emerald})
vim.api.nvim_set_hl(0, "NotifyDEBUGIcon", {bg = colors.bg_alt, fg = colors.violet})
vim.api.nvim_set_hl(0, "NotifyTRACEIcon", {bg = colors.bg_alt, fg = colors.fg_faint})
vim.api.nvim_set_hl(0, "NotifyERRORTitle", {bg = colors.bg_alt, fg = colors.fg_bright})
vim.api.nvim_set_hl(0, "NotifyWARNBTitle", {bg = colors.bg_alt, fg = colors.fg_bright})
vim.api.nvim_set_hl(0, "NotifyINFOTitle", {bg = colors.bg_alt, fg = colors.fg_bright})
vim.api.nvim_set_hl(0, "NotifyDEBUGTitle", {bg = colors.bg_alt, fg = colors.fg_bright})
vim.api.nvim_set_hl(0, "NotifyTRACETitle", {bg = colors.bg_alt, fg = colors.fg_bright})




vim.api.nvim_set_hl(0, "NotifyERRORBody", {link = "Normal"})
vim.api.nvim_set_hl(0, "NotifyWARNBBody", {link = "Normal"})
vim.api.nvim_set_hl(0, "NotifyINFOBody",  {link = "Normal"})
vim.api.nvim_set_hl(0, "NotifyDEBUGBody", {link = "Normal"})
vim.api.nvim_set_hl(0, "NotifyTRACEBody", {link = "Normal"})

end
