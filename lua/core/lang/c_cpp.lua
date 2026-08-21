local M = {}

function M.check_syntax()
    local file = vim.fn.expand("%")
    local ext = vim.fn.expand("%:e")
    local is_cpp = (ext == "cpp" or ext == "cc" or ext == "hpp" or ext == "tpp")
    local compiler = is_cpp and "c++" or "gcc"
    local std_flag = is_cpp and "-std=c++98" or ""
    local flags = string.format("-Wall -Wextra -Werror -Wshadow %s", std_flag)

    local cmd = string.format("%s %s -fsyntax-only %s 2>&1", compiler, flags, file)
    local output = vim.fn.systemlist(cmd)
    local title = is_cpp and " 󱓟 42 Compiler Check (C++98) " or " 󱓟 42 Compiler Check "

    return output, title
end

return M
