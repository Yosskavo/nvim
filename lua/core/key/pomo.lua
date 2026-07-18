-- lua/keys/pomo.lua
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>ps", function() require("pomo").start() end, vim.tbl_extend("force", opts, { desc = "Start Pomodoro" }))
vim.keymap.set("n", "<leader>pt", function() require("pomo").stop() end, vim.tbl_extend("force", opts, { desc = "Stop Pomodoro" }))
