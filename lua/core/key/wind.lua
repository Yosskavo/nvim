-- this keys for moving between windows 
vim.keymap.set("n", "<C-h>", "<C-w>h", {desc = "move to left window"})
vim.keymap.set("n", "<C-j>", "<C-w>j", {desc = "move to lower window"})
vim.keymap.set("n", "<C-k>", "<C-w>k", {desc = "move to upper window"})
vim.keymap.set("n", "<C-l>", "<C-w>l", {desc = "move to right window"})

-- this is for to split
vim.keymap.set("n", "<leader>sh", ":split<CR>", {desc = "split the window horizontaly", silent = true})
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", {desc = "split the window vertacly", silent = true})

