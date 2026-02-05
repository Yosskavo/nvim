local M = {}
local colors = require("core.theme.colors").my_colors

M.mode_colors =
{
	n        = colors.blue_sky, -- Normal
    i        = colors.yellow, -- Insert
    t        = colors.naval_green, -- Terminal
    v        = colors.violet, -- Visual
    V        = colors.violet, -- Visual Line
    ["\22"]  = colors.violet, -- Visual Block (Ctrl-V)
    c        = colors.orange_burnt, -- Command/Search
    R        = colors.red_deep, -- Replace
    s        = colors.rose, -- Select
}

return M
