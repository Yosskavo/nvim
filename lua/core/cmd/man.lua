-- 1. Register the custom man parser using nvim-treesitter API
local ok_parsers, parsers = pcall(require, 'nvim-treesitter.parsers')
if ok_parsers and parsers then
  parsers.man = {
    install_info = {
      url = 'https://github.com/ribru17/tree-sitter-man',
      files = { 'src/parser.c' },
      branch = 'master',
    },
    filetype = 'man',
  }
end

-- Also ensure TSUpdate hook is preserved
vim.api.nvim_create_autocmd('User', {
  pattern = 'TSUpdate',
  callback = function()
    local ok, p = pcall(require, 'nvim-treesitter.parsers')
    if ok and p then
      p.man = {
        install_info = {
          url = 'https://github.com/ribru17/tree-sitter-man',
          files = { 'src/parser.c' },
          branch = 'master',
        },
        filetype = 'man',
      }
    end
  end,
})

-- 2. Ensure Tree-sitter starts natively for man pages if available, or safely fallback
vim.api.nvim_create_autocmd("FileType", {
  pattern = "man",
  group = vim.api.nvim_create_augroup("TSManStart", { clear = true }),
  callback = function(args)
    local ok = pcall(vim.treesitter.start, args.buf, 'man')
    if not ok then
      vim.bo[args.buf].syntax = "man"
    end
  end,
})

vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("FloatManOverride", { clear = true }),
  callback = function()
    -- The 'force = true' flag violently overwrites the native :Man command
    vim.api.nvim_create_user_command("Man", function(opts)
      
      -- Grab the argument passed to :Man, or fallback to the word under cursor
      local topic = opts.args
      if topic == "" then
        topic = vim.fn.expand("<cword>")
      end

      -- Verify the manual exists to prevent empty floating windows
      if os.execute("man -w " .. topic .. " > /dev/null 2>&1") ~= 0 then
        vim.notify("Manual for '" .. topic .. "' not found", 3)
        return
      end

      -- 1. Create the base scratch buffer
      local bufnr = vim.api.nvim_create_buf(false, true)
      
      -- 2. Calculate dynamic dimensions based on your active terminal size
      local width = math.floor(vim.o.columns * 0.8)
      local height = math.floor(vim.o.lines * 0.8)
      
      -- 3. Render the floating window
      local win_id = vim.api.nvim_open_win(bufnr, true, {
        relative = "editor",
        width = width,
        height = height,
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
        style = "minimal",
        border = "rounded",
        title = " Manual: " .. topic .. " ",
        title_pos = "center",
      })

      vim.wo[win_id].winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder"

      -- 4. Force focus into the new window and invoke the internal man handler
      vim.api.nvim_set_current_win(win_id)
      vim.cmd("silent edit man://" .. topic)
      
      -- 5. Grab the updated buffer ID after the man:// protocol swaps it
      local man_bufnr = vim.api.nvim_get_current_buf()
      
      -- Hide it from barbar and standard buffer pickers
      vim.api.nvim_set_option_value("buflisted", false, { buf = man_bufnr })

      -- 6. Map 'q' strictly within this buffer to destroy the floating window
      vim.keymap.set("n", "q", function()
        if vim.api.nvim_win_is_valid(win_id) then
          vim.api.nvim_win_close(win_id, true)
        end
      end, { buffer = man_bufnr, silent = true })

    end, { 
      nargs = "?", 
      force = true,
      desc = "Override native :Man command with a floating UI" 
    })
  end,
})
