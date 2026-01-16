-- this is for autosave
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    group = vim.api.nvim_create_augroup("SimpleAutoSave", { clear = true }),
    pattern = "*",
    callback = function()
        if vim.bo.modified and vim.bo.buftype == "" and vim.fn.filereadable(vim.fn.expand("%")) == 1 then
            vim.cmd("silent! write")
        end
    end,
})
