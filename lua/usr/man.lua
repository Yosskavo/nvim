-- lua/usr/man.lua
return function()
  local topic = vim.fn.expand("<cword>")
  
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

  vim.wo[win_id].winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder"

  -- 1. Force the editor's focus strictly into the floating window
  vim.api.nvim_set_current_win(win_id)
  
  -- 2. THE FIX: Use Neovim's internal man:// protocol.
  -- This intercepts the edit command, compiles the man page with full syntax
  -- highlighting, and injects it straight into the active floating window.
  vim.cmd("silent edit man://" .. topic)
  
  -- 3. Because :edit deletes our empty scratch buffer and replaces it with 
  -- the actual man page buffer, we must grab the NEW buffer ID.
  local man_bufnr = vim.api.nvim_get_current_buf()
  
  -- Keep the buffer clean from your standard buffer line (like barbar)
  vim.api.nvim_set_option_value("buflisted", false, { buf = man_bufnr })

  -- 4. Map 'q' to close the float using the correct new buffer ID
  vim.keymap.set("n", "q", function()
    if vim.api.nvim_win_is_valid(win_id) then
      vim.api.nvim_win_close(win_id, true)
    end
  end, { buffer = man_bufnr, silent = true })
end
