-- Jump cursor to the latest notification
vim.keymap.set("n", "<leader>wn", function()
    local found = false
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        if vim.bo[buf].filetype == "notify" then
            vim.api.nvim_set_current_win(win)
            found = true
            break
        end
    end
    if not found then print("No notifications found") end
end, { desc = "Jump to Notification" })

-- This one clears EVERYTHING immediately without moving your cursor
vim.keymap.set("n", "<leader>nc", function()
    require("notify").dismiss({ silent = true, pending = true })
end, { desc = "Clear all notifications" })

