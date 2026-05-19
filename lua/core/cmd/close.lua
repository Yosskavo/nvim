-- Close special temporary windows with 'q' or '<Esc>'
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "qf",            -- Quickfix list
        "help",          -- Help menus
        "man",           -- Man pages
        "notify",        -- Notification popups
        "lspinfo",       -- LSP information windows
        "checkhealth",   -- :checkhealth screens
        "tsplayground",  -- Tree-sitter playground
        "gitsigns.blame" -- Git blame popups
    },
    callback = function(event)
        -- Prevent these temporary buffers from cluttering your buffer list
        vim.bo[event.buf].buflisted = false
        
        -- Map 'q' to close the window
        vim.keymap.set("n", "q", "<cmd>close<CR>", { 
            buffer = event.buf, silent = true, nowait = true 
        })
        
        -- Map '<Esc>' to close the window
        vim.keymap.set("n", "<Esc>", "<cmd>close<CR>", { 
            buffer = event.buf, silent = true, nowait = true 
        })
    end,
})
