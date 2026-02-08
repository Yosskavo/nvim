return {
  "kevinhwang91/nvim-ufo",
  event = "BufRead",
  config = function()
    -- These options are REQUIRED for ufo to work properly
    vim.o.foldcolumn = '1' -- '0' if you don't want the side bar
    vim.o.foldlevel = 99 -- Using ufo provider needs a large value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Use Treesitter as the main provider for your C/C++ projects
    require('ufo').setup({
      provider_selector = function(bufnr, filetype, buftype)
        return {'treesitter', 'indent'}
      end
    })

    -- Mapping for open/close all (za and zA are built-in and will just work)
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
  end,
}
