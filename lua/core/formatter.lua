-- formatting c files
local M = {}

function M.format_42()
    local ft = vim.bo.filetype
    
    -- 1. Check filetype
    if ft ~= "c" and ft ~= "cpp" and ft ~= "cs" then 
        print("Not a C file. Skipping Norm.")
        return
    end

    -- 2. Save current state
    local cursor_pos = vim.api.nvim_win_get_cursor(0)
    local file = vim.fn.expand("%")

    -- 3. Run format
    -- We use 'write' first so the external tool sees your changes
    vim.cmd("write")
    
    print("Executing c_formatter_42...")
    vim.fn.system("c_formatter_42 " .. file)

    -- 4. Reload and restore
    -- edit! refreshes the buffer from the disk
    vim.cmd("edit!")
    pcall(vim.api.nvim_win_set_cursor, 0, cursor_pos)
    
    print("Norm applied!")
end

return M
