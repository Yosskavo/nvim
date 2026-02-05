-- Import your norm module (assuming it's in lua/core/norm.lua)
local norm_utils = require("core.norm")

-- 1. Norminette Formatter (c_formatter_42)
vim.keymap.set("n", "<localleader>fn", function()
    norm_utils.format_42()
end, { desc = "Run 42 Formatter" })

-- 2. 42 Standard Header
-- Note: This requires the '42header' plugin installed
vim.keymap.set("n", "<localleader>fh", "<cmd>Stdheader<CR>", { desc = "Insert 42 Header" })
