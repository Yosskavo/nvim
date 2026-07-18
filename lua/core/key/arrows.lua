local opts = { noremap = true, silent = true }

-- 1. Helper function to generate the warning message
-- local function hard_mode_hint(key, alternative)
--     return function()
--         -- Using WARNING level so Noice gives it a distinct color/icon (usually yellow/orange)
--         vim.notify(" 󰰍  Use '" .. alternative .. "' instead of " .. key, vim.log.levels.WARN, { title = "Discipline" })
--     end
-- end
--
-- 2. Normal and Visual mode mappings

-- vim.keymap.set({'n', 'v'}, '<Up>', hard_mode_hint('<Up>', 'k'), opts)
-- vim.keymap.set({'n', 'v'}, '<Down>', hard_mode_hint('<Down>', 'j'), opts)
-- vim.keymap.set({'n', 'v'}, '<Left>', hard_mode_hint('<Left>', 'h'), opts)
-- vim.keymap.set({'n', 'v'}, '<Right>', hard_mode_hint('<Right>', 'l'), opts)

-- 3. Insert mode mappings (Optional, but highly recommended)
-- vim.keymap.set('i', '<Up>', hard_mode_hint('<Up>', '<Esc> then k or <A-k>'), opts)
-- vim.keymap.set('i', '<Down>', hard_mode_hint('<Down>', '<Esc> then j or <A-j>'), opts)
-- vim.keymap.set('i', '<Left>', hard_mode_hint('<Left>', '<Esc> then h or <A-h>'), opts)
-- vim.keymap.set('i', '<Right>', hard_mode_hint('<Right>', '<Esc> then l or <A-l>'), opts)
--
-- 4. Command-line mode mappings (for / search and : commands)
-- vim.keymap.set('c', '<Up>', hard_mode_hint('<Up>', '<C-p>'), opts)
-- vim.keymap.set('c', '<Down>', hard_mode_hint('<Down>', '<C-n>'), opts)
