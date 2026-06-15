-- Normal mode keymaps for Glance
-- 'gd' uses Glance to peek at the .cpp body
vim.keymap.set('n', '<leader>gd', '<cmd>Glance definitions<CR>', {desc = "glance definitions"})
-- 'gD' uses native Neovim to instantly jump to the .hpp header prototype
vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, {desc = "glance declaration"})

vim.keymap.set('n', '<leader>gR', '<cmd>Glance references<CR>', { desc = "Glance References" })
vim.keymap.set('n', '<leader>gY', '<cmd>Glance type_definitions<CR>', { desc = "Glance Type Definition" })
vim.keymap.set('n', '<leader>gM', '<cmd>Glance implementations<CR>', { desc = "Glance Implementation" })
