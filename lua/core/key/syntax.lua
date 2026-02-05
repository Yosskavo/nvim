-- this is for switch tabs
vim.keymap.set("n", "<Tab>", function() vim.cmd("tabnext") end, { desc = "Next tab" })
vim.keymap.set("n", "<S-Tab>", function() vim.cmd("tabprevious") end, { desc = "Previous tab" })
