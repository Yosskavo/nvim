-- this is to turn on the teminal color
vim.opt.termguicolors = true

-- the characters in the places that unwrighted
vim.opt.fillchars = { eob = " " }

-- clip board
vim.opt.clipboard = "unnamedplus"

-- for tabs
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = false

-- this for the numbers in the side
vim.opt.number = true
vim.opt.relativenumber = true

-- this is for line hightlight
vim.opt.cursorline = true

-- change the leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- this to turn off the swap files
vim.opt.swapfile = false

-- to show how much line*coloums you select in the visual mode
vim.opt.showcmd = true

-- this is for aligned the start
vim.opt.signcolumn = "auto"

-- this is for statusline to be global in all window's
vim.opt.laststatus = 3

-- this is for history undo file
vim.opt.undofile = true

-- this is for the theme's
vim.lsp.semantic_tokens.enable = false

-- tabline
-- vim.o.showtabline = 2
-- vim.opt.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'
-- vim.opt.hidden = true

-- Sets the delay for CursorHold (and swap file writing) to 250ms
vim.opt.updatetime = 0
-- vim.o.winborder = "rounded"


