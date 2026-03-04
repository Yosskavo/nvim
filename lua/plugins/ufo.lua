return {
  "kevinhwang91/nvim-ufo",
  event = "BufRead",
  config = function()
    vim.o.foldcolumn = '1'
    vim.o.foldlevel = 99
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    -- Custom handler to display Line Count + Git Blame
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = (" 󰁂 %d lines "):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0

      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, {chunkText, hlGroup})
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end

      -- Get Git Blame info using Gitsigns
      local bmeta = vim.b.gitsigns_blame_line_dict
      local author = (bmeta and bmeta.author) and (" • " .. bmeta.author) or ""
      
      table.insert(newVirtText, { suffix, "MoreMsg" })
      table.insert(newVirtText, { author, "Comment" }) -- Shows the name in grey
      return newVirtText
    end

    require('ufo').setup({
      fold_virt_text_handler = handler,
      provider_selector = function()
        return {'treesitter', 'indent'}
      end
    })
  end,
}
