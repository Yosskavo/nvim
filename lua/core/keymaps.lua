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

-- this is for switch tabs
vim.keymap.set("n", "<Tab>", function() vim.cmd("tabnext") end, { desc = "Next tab" })
vim.keymap.set("n", "<S-Tab>", function() vim.cmd("tabprevious") end, { desc = "Previous tab" })


-----------------------------! for norminette or formating files by extentions !-------------------------------------------
-- this is for norminette
vim.keymap.set("n", "<leader>nf", function() require("core.formatter").format_42() end, { desc = "42 Norm Formatter", silent = true }) -- this is for formatting
vim.keymap.set("n", "<leader>nh", ":Stdheader<CR>", { desc = "42 header", silent = true }) -- this is for header


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

--- for todo-comments
vim.keymap.set("n", "<leader>tf", ":TodoLocList<CR>", {desc = "find todo-comments", silent = true})
vim.keymap.set("n", "<leader>ft", ":TodoTelescope<CR>", {desc = "find todo-comments", silent = true})

--- this is for trouble
vim.keymap.set("n", "<leader>xx", ":Trouble diagnostics toggle<CR>", {desc = "Diagnostics (Trouble)", silent = true})
vim.keymap.set("n", "<leader>xX", ":Trouble diagnostics toggle filter.buf=0<CR>", {desc = "Buffer Diagnostics (Trouble)", silent = true})
vim.keymap.set("n", "<leader>xs", ":Trouble symbols toggle focus=false<CR>", {desc = "Symbols (Trouble)", silent = true})
vim.keymap.set("n", "<leader>xl", ":Trouble lsp toggle focus=false win.position=right<CR>", {desc = "LSP Definitions / references / ... (Trouble)", silent = true})
vim.keymap.set("n", "<leader>xL", ":Trouble loclist toggle<CR>", {desc = "Location List (Trouble)", silent = true})
vim.keymap.set("n", "<leader>xQ", ":Trouble qflist toggle<CR>", {desc = "Quickfix List (Trouble)", silent = true})

--- for nvim-tree || files
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {desc = "Toggle NvimTree", silent = true})
