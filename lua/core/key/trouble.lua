--- this is for trouble
vim.keymap.set("n", "<leader>xx", ":Trouble diagnostics toggle<CR>", {desc = "Diagnostics (Trouble)", silent = true})
vim.keymap.set("n", "<leader>xX", ":Trouble diagnostics toggle filter.buf=0<CR>", {desc = "Buffer Diagnostics (Trouble)", silent = true})
vim.keymap.set("n", "<leader>xs", ":Trouble symbols toggle focus=false<CR>", {desc = "Symbols (Trouble)", silent = true})
vim.keymap.set("n", "<leader>xl", ":Trouble lsp toggle focus=false win.position=right<CR>", {desc = "LSP Definitions / references / ... (Trouble)", silent = true})
vim.keymap.set("n", "<leader>xL", ":Trouble loclist toggle<CR>", {desc = "Location List (Trouble)", silent = true})
vim.keymap.set("n", "<leader>xQ", ":Trouble qflist toggle<CR>", {desc = "Quickfix List (Trouble)", silent = true})
