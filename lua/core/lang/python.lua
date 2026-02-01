local M = {}

function M.check_syntax()
    local file = vim.fn.expand("%")
    local cmd = string.format("flake8 %s 2>&1", file)
    local output = vim.fn.systemlist(cmd)
    local title = "  Python Flake8 "

    return output, title
end

function M.execute()
    local file = vim.fn.expand("%")
    vim.cmd("silent! write")
    vim.cmd("TermExec cmd='python3 " .. file .. "'")
end

return M
