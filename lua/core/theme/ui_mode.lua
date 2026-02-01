local M = {}

M.mode_colors =
{
	n        = "#7aa2f7", -- Normal (Blue)
    i        = "#e0af68", -- Insert (Yellow)
    t        = "#9ece6a", -- Terminal (Green)
    v        = "#bb9af7", -- Visual (Purple)
    V        = "#bb9af7", -- Visual Line
    ["\22"]  = "#bb9af7", -- Visual Block (Ctrl-V)
    c        = "#f7768e", -- Command/Search (Red)
    R        = "#ff9e64", -- Replace (Orange)
    s        = "#ff007c", -- Select
}

return M
