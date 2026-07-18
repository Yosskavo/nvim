-- lua/keys/spotify.lua
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>Ss", ":Spotify play/pause<CR>", vim.tbl_extend("force", opts, { desc = "Spotify Play/Pause" }))
vim.keymap.set("n", "<leader>Sj", ":Spotify next<CR>", vim.tbl_extend("force", opts, { desc = "Spotify Next" }))
vim.keymap.set("n", "<leader>Sk", ":Spotify prev<CR>", vim.tbl_extend("force", opts, { desc = "Spotify Prev" }))
vim.keymap.set("n", "<leader>Sc", ":Spotify status<CR>", vim.tbl_extend("force", opts, { desc = "Spotify Status" }))
