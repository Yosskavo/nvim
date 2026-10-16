local map = vim.keymap.set

map('n', '<localleader>cp', '<cmd>NewProject<CR>', {desc = 'New Project'})
map('n', '<localleader>cm', '<cmd>GenMake<CR>', {desc = 'Generate Makefile'})
map('n', '<localleader>cc', '<cmd>Clone<CR>', {desc = 'Clone Repo'})
map('n', '<localleader>cu', '<cmd>InvertedUpdate<CR>', {desc = 'Update Config'})
