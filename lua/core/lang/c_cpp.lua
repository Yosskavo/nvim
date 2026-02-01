local M = {}
local flags = "-Wall -Wextra -Werror -Wshadow"

function M.check_syntax()
    local file = vim.fn.expand("%")
    local ext = vim.fn.expand("%:e")
    local compiler = (ext == "cpp" or ext == "cc") and "g++" or "gcc"

    local cmd = string.format("%s %s -fsyntax-only %s 2>&1", compiler, flags, file)
    local output = vim.fn.systemlist(cmd)
    local title = " 󱓟 42 Compiler Check "

    return output, title
end

return M
