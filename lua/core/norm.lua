-- formatting c files
local M = {}

function M.format_42()
    local ft = vim.bo.filetype
    if ft ~= "c" and ft ~= "h" then
        print("Not a C/C++ file. Skipping Norm.")
        return
    end

    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local file = vim.fn.expand("%")

    -- Save before formatting
    vim.cmd("silent write")

    -- Use vim.system for a cleaner execution
    vim.system({ "c_formatter_42", file }, { text = true }, function(obj)
        vim.schedule(function()
            if obj.code == 0 then
                vim.cmd("edit!")
                pcall(vim.api.nvim_win_set_cursor, 0, cursor_pos)
                print("Norm applied!")
            else
                print("Formatter error: " .. (obj.stderr or "unknown error"))
            end
        end)
    end)
end

return M
