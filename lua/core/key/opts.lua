-- some key maps options
vim.keymap.set('n', '<leader>fn', ":new<CR>", {desc = "new file", silent = true})

-- Press <Esc> to clear search highlights
vim.keymap.set("n", "<Esc>", "<cmd>noh<CR><Esc>", { desc = "Clear search highlights" })
