vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Get the name of the theme that was just set
    local theme = vim.g.colors_name
    
    -- Define where to save it
    local path = vim.fn.stdpath("config") .. "/lua/core/theme_user.lua"
    
    -- Create the Lua file with the 'return' format we used before
    local file = io.open(path, "w")
    if file then
      file:write('return { theme = "' .. theme .. '" }\n')
      file:close()
    end
  end,
})
