vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = { "*.tpp", "*.ipp" },
    callback = function()
        -- 1. Force Neovim to treat the buffer as C++
        vim.bo.filetype = "cpp"
        
        -- 2. Explicitly tell Tree-sitter to attach and start highlighting
        pcall(vim.treesitter.start, 0, "cpp")
    end,
})
