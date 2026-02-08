local M = {}

M.show_rules = function()
  local Popup = require("nui.popup")
  local NuiLine = require("nui.line")
  local event = require("nui.utils.autocmd").event

  local popup = Popup({
    enter = true,
    focusable = true,
    border = {
      style = "rounded",
      text = {
        top = " [ 42 Norminette Cheat-Sheet ] ",
        top_align = "center",
      },
    },





    position = "50%",
    size = {
      width = 60,
      height = 12,
    },
    win_options = {
      winhighlight = "Normal:Normal,Border:FloatBorder",
    },
  })

  popup:mount()

  -- Auto-close settings
  popup:map("n", "q", function() popup:unmount() end)
  popup:on(event.BufLeave, function() popup:unmount() end)

  -- Function to help us build colored lines easily
  local function add_line(content)
    local line = NuiLine()
    for _, segment in ipairs(content) do
      line:append(segment[1], segment[2])
    end
    return line
  end

  -- Build the colored lines
  -- Format: { "Text", "HighlightGroup" }
  local lines = {
    add_line({ { " 1. ", "Number" }, { "No more than ", "Text" }, { "25 lines", "DiagnosticError" }, { " per function.", "Text" } }),
    add_line({ { " 2. ", "Number" }, { "No more than ", "Text" }, { "5 functions", "DiagnosticError" }, { " per file.", "Text" } }),
    add_line({ { " 3. ", "Number" }, { "Max ", "Text" }, { "4 variables", "DiagnosticWarn" }, { " per function.", "Text" } }),
    add_line({ { " 4. ", "Number" }, { "Comments", "String" }, { " must be on their own lines.", "Text" } }),
    add_line({ { " 5. ", "Number" }, { "Declarations", "Keyword" }, { " must be at the start of blocks.", "Text" } }),
    add_line({ { " 6. ", "Number" }, { "No ", "DiagnosticError" }, { "'for'", "Keyword" }, { " loops (use ", "Text" }, { "'while'", "Keyword" }, { ").", "Text" } }),
    add_line({ }), -- Empty line
    add_line({ { " [ Press 'q' to close ] ", "Comment" } }),
  }

  -- Render all lines into the popup buffer
  for i, line in ipairs(lines) do
    line:render(popup.bufnr, -1, i)
  end
end

return M
