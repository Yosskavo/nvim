-- lua/keys/manual.lua
local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<localleader>m", function()
  local extension = vim.fn.expand("%:e")

  if extension == "cpp" or extension == "hpp" then
    require('cppman').open_cppman_for(vim.fn.expand("<cword>"))
  elseif extension == "c" or extension == "h" then
    -- This calls the function returned by lua/usr/man.lua
    require("usr.man")()
  else
    vim.notify("No special manual/rules for ." .. extension, 2)
  end
end, vim.tbl_extend("force", opts, { desc = "Dynamic Manual/Norm Rules" }))
