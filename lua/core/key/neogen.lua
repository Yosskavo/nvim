-- lua/keys/neogen.lua
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>dg", ":lua require('neogen').generate()<CR>", vim.tbl_extend("force", opts, { desc = "Generate Doc" }))
