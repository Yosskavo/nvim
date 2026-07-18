-- Import your norm module (assuming it's in lua/core/norm.lua)
local norm_utils = require("core.norm")

-- lua/keys/norm.lua
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>hn", function()
    -- This requires the file and executes the show_rules function inside it
    require("usr.norm").show_rules()
end, vim.tbl_extend("force", opts, { desc = "Norminette Cheat-Sheet" }))

-- 2. 42 Standard Header
-- Note: This requires the '42header' plugin installed
vim.keymap.set("n", "<localleader>fh", "<cmd>Stdheader<CR>", { desc = "Insert 42 Header" })
