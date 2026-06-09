-- 1. Register the custom man parser using the new nvim-treesitter API
vim.api.nvim_create_autocmd('User', {
  pattern = 'TSUpdate',
  callback = function()
    require('nvim-treesitter.parsers').man = {
      install_info = {
        url = 'https://github.com/ribru17/tree-sitter-man',
        files = { 'src/parser.c' },
        branch = 'master',
      },
    }
  end,
})

-- 2. Ensure Tree-sitter starts natively for man pages in 0.12.0
vim.api.nvim_create_autocmd("FileType", {
  pattern = "man",
  group = vim.api.nvim_create_augroup("TSManStart", { clear = true }),
  callback = function(args)
    vim.treesitter.start(args.buf, 'man')
  end,
})
