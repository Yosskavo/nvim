-- Import your norm module
local norm_utils = require("core.norm")

local opts = { noremap = true, silent = true }

-- 1. Norminette Cheat-Sheet (Static rules popup)
vim.keymap.set("n", "<leader>hn", function()
    require("usr.test").show_rules()
end, vim.tbl_extend("force", opts, { desc = "Norminette Cheat-Sheet" }))

-- 2. Live Norminette Check on Current File
vim.keymap.set("n", "<leader>hc", function()
    require("usr.norm").show_rules()
end, vim.tbl_extend("force", opts, { desc = "Run Norminette Check" }))

-- 3. 42 C Formatter (c_formatter_42)
vim.keymap.set("n", "<localleader>fn", function()
    norm_utils.format_42()
end, vim.tbl_extend("force", opts, { desc = "Apply 42 Norm Formatter" }))

-- 4. 42 Standard Header
vim.keymap.set("n", "<localleader>fh", "<cmd>Stdheader<CR>", vim.tbl_extend("force", opts, { desc = "Insert 42 Header" }))
