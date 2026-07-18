-- lua/keys/dial.lua
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<C-a>", function() require("dial.map").inc_normal() end, vim.tbl_extend("force", opts, { expr = true, desc = "Increment" }))
vim.keymap.set("n", "<C-x>", function() require("dial.map").dec_normal() end, vim.tbl_extend("force", opts, { expr = true, desc = "Decrement" }))
vim.keymap.set("v", "g<C-a>", function() require("dial.map").inc_gvisual() end, vim.tbl_extend("force", opts, { expr = true, desc = "Increment (Visual Block)" }))
vim.keymap.set("v", "g<C-x>", function() require("dial.map").dec_gvisual() end, vim.tbl_extend("force", opts, { expr = true, desc = "Decrement (Visual Block)" }))
