-- lua/core/key/harpoon.lua
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

local function get_harpoon()
  return require("harpoon")
end

-- Harpoon operations
map("n", "<leader>a", function()
  get_harpoon():list():add()
  vim.notify("󱡁 File added to Harpoon", vim.log.levels.INFO, { title = "Harpoon" })
end, vim.tbl_extend("force", opts, { desc = "Harpoon Add File" }))

map("n", "<C-e>", function()
  local h = get_harpoon()
  h.ui:toggle_quick_menu(h:list())
end, vim.tbl_extend("force", opts, { desc = "Harpoon Quick Menu" }))

map("n", "<leader>he", function()
  local h = get_harpoon()
  h.ui:toggle_quick_menu(h:list())
end, vim.tbl_extend("force", opts, { desc = "Harpoon Quick Menu" }))

-- Direct slot navigation (1-4)
map("n", "<leader>1", function() get_harpoon():list():select(1) end, vim.tbl_extend("force", opts, { desc = "Harpoon Slot 1" }))
map("n", "<leader>2", function() get_harpoon():list():select(2) end, vim.tbl_extend("force", opts, { desc = "Harpoon Slot 2" }))
map("n", "<leader>3", function() get_harpoon():list():select(3) end, vim.tbl_extend("force", opts, { desc = "Harpoon Slot 3" }))
map("n", "<leader>4", function() get_harpoon():list():select(4) end, vim.tbl_extend("force", opts, { desc = "Harpoon Slot 4" }))

-- Cycle through Harpoon list
map("n", "<leader>hk", function() get_harpoon():list():prev() end, vim.tbl_extend("force", opts, { desc = "Harpoon Prev File" }))
map("n", "<leader>hj", function() get_harpoon():list():next() end, vim.tbl_extend("force", opts, { desc = "Harpoon Next File" }))
