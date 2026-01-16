-----------------------------! this is for system thing's !-------------------------------------------
-- this to save and source the config
vim.keymap.set("n", "<leader>s", ":w<CR>:source %<CR>", {desc = "sourcing the file of config", silent = true})


-----------------------------! this is for window's monipulate !-------------------------------------------
-- this keys for moving between windows 
vim.keymap.set("n", "<C-h>", "<C-w>h", {desc = "move to left window"})
vim.keymap.set("n", "<C-j>", "<C-w>j", {desc = "move to lower window"})
vim.keymap.set("n", "<C-k>", "<C-w>k", {desc = "move to upper window"})
vim.keymap.set("n", "<C-l>", "<C-w>l", {desc = "move to right window"})

-- this is for to split
vim.keymap.set("n", "<leader>sh", ":split<CR>", {desc = "split the window horizontaly", silent = true})
vim.keymap.set("n", "<leader>sv", ":vsplit<CR>", {desc = "split the window vertacly", silent = true})


-----------------------------! for norminette or formating files by extentions !-------------------------------------------
-- this is for norminette
vim.keymap.set("n", "<leader>nf", function() require("core.formatter").format_42() end, { desc = "42 Norm Formatter", silent = true }) -- this is for formatting


-----------------------------! move or for editing !-------------------------------------------

-- Move Lines
vim.keymap.set("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
vim.keymap.set("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
vim.keymap.set("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
vim.keymap.set("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })




-----------------------------! file and buffers !-------------------------------------------
--- for telescope || files
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fn', ":new<CR>", {desc = "new file", silent = true})

