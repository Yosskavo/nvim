-- lua/usr/norm.lua
local M = {}

M.show_rules = function()
  local Popup = require("nui.popup")
  local event = require("nui.utils.autocmd").event

  -- 1. Grab the current active file path
  local current_file = vim.api.nvim_buf_get_name(0)
  if current_file == "" then
    vim.notify(" 󰰍  Buffer has no file name saved yet!", vim.log.levels.WARN, { title = "Norminette" })
    return
  end

  -- 2. Build a responsive floating container layout
  local popup = Popup({
    enter = true,
    focusable = true,
    border = {
      style = "rounded",
      text = {
        top = " [ Norminette Output ] ",
        top_align = "center",
      },
    },
    position = "50%",
    size = {
      width = math.floor(vim.o.columns * 0.75),
      height = math.floor(vim.o.lines * 0.60),
    },
    win_options = {
      winhighlight = "Normal:NormalFloat,Border:FloatBorder",
    },
  })

  popup:mount()

  -- 3. Setup window destruction event hooks
  popup:map("n", "q", function() popup:unmount() end)
  popup:on(event.BufLeave, function() popup:unmount() end)

  -- 4. Set temporary scratchpad options for the popup buffer
  vim.api.nvim_set_option_value("buftype", "nofile", { buf = popup.bufnr })
  vim.api.nvim_set_option_value("swapfile", false, { buf = popup.bufnr })

  -- 5. Append instructions on how to exit at the very top
  vim.api.nvim_buf_set_lines(popup.bufnr, 0, -1, false, {
    " 󰌑  Press 'q' to close this window",
    " ───────────────────────────────────",
    " Analyzing: " .. vim.fn.fnamemodify(current_file, ":t"),
    "",
  })

  -- 6. Asynchronously spawn norminette to prevent UI freezing
  vim.fn.jobstart({ "norminette", current_file }, {
    stdout_buffered = true,
    stderr_buffered = true,
    on_stdout = function(_, data)
      if data then
        -- Append the raw tool output straight into the window
        vim.api.nvim_buf_set_lines(popup.bufnr, -1, -1, false, data)
      end
    end,
    on_stderr = function(_, data)
      if data and data[1] ~= "" then
        vim.api.nvim_buf_set_lines(popup.bufnr, -1, -1, false, data)
      end
    end,
  })
end

return M
