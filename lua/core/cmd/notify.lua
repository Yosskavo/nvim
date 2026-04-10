vim.api.nvim_create_autocmd("FileType", {
    pattern = "notify",
    callback = function(event)
        -- 1. Map 'q' and '<Esc>' to close the notification window
        -- We use <buffer> so it only affects the notification itself
        vim.keymap.set("n", "q", function()
            vim.api.nvim_win_close(0, true)
        end, { buffer = event.buf, silent = true })

        vim.keymap.set("n", "<Esc>", function()
            vim.api.nvim_win_close(0, true)
        end, { buffer = event.buf, silent = true })
    end,
})
