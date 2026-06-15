-- this is for the hover in lsp
vim.keymap.set("i", "<A-S-k>", function() vim.lsp.buf.hover() end, {desc = "hover lsp", silent = true})
vim.keymap.set("v", "<S-k>", function() vim.lsp.buf.hover() end, {desc = "hover lsp", silent = true})



