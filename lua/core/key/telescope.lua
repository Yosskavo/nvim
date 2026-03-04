--- for telescope || files
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><leader>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fH', ":FzfLua highlights<CR>", { desc = 'Telescope the highlights', silent = true })
vim.keymap.set('n', '<localleader>sw', require('telescope.builtin').spell_suggest, { desc = 'Spell suggestions' })
