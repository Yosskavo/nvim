-- some key maps options
vim.keymap.set('n', '<leader>fn', ":new<CR>", {desc = "new file", silent = true})
vim.keymap.set('n', '<Esc>', ":nohlsearch<CR>", {desc = "clear search", silent = true})

-- Press <Esc> to clear search highlights
-- vim.keymap.set("n", "<Esc>", function()
--   -- Check if there's a floating window open
--   for _, win in ipairs(vim.api.nvim_list_wins()) do
--     if vim.api.nvim_win_get_config(win).relative ~= "" then
--       vim.api.nvim_win_close(win, false)
--       return
--     end
--   end
--   -- If no float, just clear search highlights (standard Esc behavior)
--   vim.cmd("nohlsearch")
-- end, { desc = "Close floating windows or clear highlights" })
