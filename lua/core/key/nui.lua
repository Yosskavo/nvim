-- Trigger the Norminette helper with <leader>nh (Norm Help)
vim.keymap.set("n", "<localleader>m", function()
  -- Get the extension of the current file
  local extension = vim.fn.expand("%:e")

  if extension == "cpp" or extension == "hpp" then
    -- Run your Norminette/Rules logic for C++
    require('cppman').open_cppman_for(vim.fn.expand("<cword>"))
  elseif extension == "c" or extension == "h" then
    -- Run your Smart Man Popup for C
    require("usr.man")()
  else
    -- Optional: Notify if the filetype isn't supported
    vim.notify("No special manual/rules for ." .. extension, 2)
  end
end, { desc = "Dynamic Manual/Norm Rules" })



vim.keymap.set("n", "<leader>hn", function()
	require("usr.norm")()
end, { desc = "Normenette rules" })
