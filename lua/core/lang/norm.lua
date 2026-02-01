local M = {}

function M.check_norm()
    local file = vim.fn.expand("%")
    -- Runs norminette on the current file
    local cmd = string.format("norminette %s 2>&1", file)
    local output = vim.fn.systemlist(cmd)
    local title = " 󱗖 Norminette Check "

    return output, title
end

return M
