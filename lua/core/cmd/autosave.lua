-- this is for autosave
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    group = vim.api.nvim_create_augroup("SimpleAutoSave", { clear = true }),
    pattern = "*",
    callback = function()
        -- Check if buffer is modified, is a normal file, and has a filename
        if vim.bo.modified and vim.bo.buftype == "" and vim.fn.expand("%") ~= "" then
            -- Use pcall (protected call) to prevent error messages from popping up
            pcall(vim.api.nvim_command, "silent! write")
        end
    end,
})
