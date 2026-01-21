--- this is for highlight the yank (copy) to know what you copied
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
		if vim.v.event.operator == 'y' then
			vim.hl.on_yank({ higroup='Substitute', timeout=300 })
		elseif vim.v.event.operator == 'd' then
			vim.hl.on_yank({ higroup='Error', timeout=300 })
		elseif vim.v.event.operator == 'c' then
			vim.hl.on_yank({ higroup='DiffText', timeout=300 })
		end
  end,
})

-- this is for treesitter highlighting
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    pcall(vim.treesitter.start)
  end,
})
