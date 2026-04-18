local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Move to previous/next (Shift + h/l)
map('n', '<S-h>', '<Cmd>BufferLineCyclePrev<CR>', opts)
map('n', '<S-l>', '<Cmd>BufferLineCycleNext<CR>', opts)

-- Re-order to previous/next (Alt + < or >)
map('n', '<A-<>', '<Cmd>BufferLineMovePrev<CR>', opts)
map('n', '<A->>', '<Cmd>BufferLineMoveNext<CR>', opts)

-- Goto buffer in position... (Alt + Number)
map('n', '<A-1>', '<Cmd>BufferLineGoToBuffer 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferLineGoToBuffer 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferLineGoToBuffer 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferLineGoToBuffer 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferLineGoToBuffer 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferLineGoToBuffer 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferLineGoToBuffer 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferLineGoToBuffer 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferLineGoToBuffer 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLineGoToBuffer -1<CR>', opts) -- Goes to last

-- Pin/unpin buffer
-- Bufferline uses a built-in group for pins
map('n', '<A-p>', '<Cmd>BufferLineTogglePin<CR>', opts)

-- Close buffer (Alt + c)
-- Since Bufferline doesn't "own" the buffers, we just use bdelete
map('n', '<A-c>', '<Cmd>bdelete<CR>', opts)

-- Magic buffer-picking mode (Control + p)
map('n', '<C-p>', '<Cmd>BufferLinePick<CR>', opts)
map('n', '<C-s-p>', '<Cmd>BufferLinePickClose<CR>', opts)

-- Sort automatically by... (Space + b + letter)
map('n', '<Space>bb', '<Cmd>BufferLineSortByTabs<CR>', opts)
map('n', '<Space>bn', '<Cmd>BufferLineSortByExtension<CR>', opts) -- Sorts by file type
map('n', '<Space>bd', '<Cmd>BufferLineSortByDirectory<CR>', opts)

-- Extra helper: Close all buffers except current
map('n', '<leader>ba', '<Cmd>BufferLineCloseOthers<CR>', opts)
