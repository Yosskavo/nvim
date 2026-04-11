-- Open terminal in a horizontal split (bottom)
vim.keymap.set('n', '<leader>th', ':split | term<CR>i', { desc = 'Terminal Horizontal' })

-- Open terminal in a vertical split (right)
vim.keymap.set('n', '<leader>tv', ':vsplit | term<CR>i', { desc = 'Terminal Vertical' })

-- Open terminal in a new tab (simulates a full-screen/float feel)
vim.keymap.set('n', '<leader>tt', ':tabedit | term<CR>i', { desc = 'Terminal Tab' })
