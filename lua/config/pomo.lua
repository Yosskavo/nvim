-- lua/config/pomo.lua
return function(_, opts)
  require("pomo").setup({
    session_minutes = 25, 
    break_minutes = 5,   
  })
end
