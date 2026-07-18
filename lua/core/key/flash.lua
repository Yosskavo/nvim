-- lua/keys/flash.lua
local opts = { noremap = true, silent = true }

vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, vim.tbl_extend("force", opts, { desc = "Flash" }))
vim.keymap.set({ "n", "x", "o" }, "X", function() require("flash").treesitter() end, vim.tbl_extend("force", opts, { desc = "Flash Treesitter" }))
vim.keymap.set("o", "r", function() require("flash").remote() end, vim.tbl_extend("force", opts, { desc = "Remote Flash" }))
vim.keymap.set({ "o", "x" }, "R", function() require("flash").treesitter_search() end, vim.tbl_extend("force", opts, { desc = "Treesitter Search" }))
vim.keymap.set("c", "<c-s>", function() require("flash").toggle() end, vim.tbl_extend("force", opts, { desc = "Toggle Flash Search" }))
