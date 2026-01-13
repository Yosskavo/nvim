-- this to save and source the config
vim.keymap.set("n", "<leader>s", ":w<CR>:source %<CR>", {silent = true})


-- this keys for moving between windows 
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- this is for to split
vim.keymap.set("n", "<leader>sh", ":split<CR>", {silent = true})
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", {silent = true})
