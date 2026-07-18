-- lua/keys/hover.lua
local opts = { noremap = true, silent = true }

-- Using an anonymous function here ensures hover.nvim is lazy-loaded only when you press K
vim.keymap.set("n", "K", function() require("hover").open() end, vim.tbl_extend("force", opts, { desc = "hover.nvim" }))
vim.keymap.set("n", "gK", function() require("hover").select() end, vim.tbl_extend("force", opts, { desc = "hover.nvim (select)" }))
vim.keymap.set("n", "<MouseMove>", function() require("hover").hover_mouse() end, vim.tbl_extend("force", opts, { desc = "hover.nvim (mouse)" }))
