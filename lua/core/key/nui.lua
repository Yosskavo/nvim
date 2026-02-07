-- Trigger the Norminette helper with <leader>nh (Norm Help)
vim.keymap.set('n', '<localleader>hn', function() require('usr.test').show_rules() end, { desc = "Show Norminette Rules" })
