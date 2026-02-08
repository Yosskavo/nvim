return function()
local topic = vim.fn.expand("<cword>")
  
  -- Check if man page exists
  if os.execute("man -w " .. topic .. " > /dev/null 2>&1") ~= 0 then
    vim.notify("Manual for '" .. topic .. "' not found", 3)
    return
  end

  local bufnr = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  
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

  -- --- THE CRITICAL FIX ---
  -- 1. Set the filetype FIRST so :Man doesn't split
  vim.bo[bufnr].filetype = "man"
  
  -- 2. Use the modern 0.11 API for other settings
  vim.api.nvim_set_option_value("buftype", "nofile", { buf = bufnr })
  vim.wo[win_id].winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder"

  -- 3. Execute the command directly in the buffer
  vim.api.nvim_buf_call(bufnr, function()
    -- Use the '!' or 'silent' to avoid extra redraws
    vim.cmd("silent Man " .. topic)
    
    -- Map 'q' to close this specific window
    vim.keymap.set("n", "q", function()
      if vim.api.nvim_win_is_valid(win_id) then
        vim.api.nvim_win_close(win_id, true)
      end
    end, { buffer = bufnr })
  end)
end

-- Your new leader keymap
-- vim.keymap.set("n", "<leader>m", native_man_float, { desc = "Native Man Float" })
