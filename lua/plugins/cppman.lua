-- lua/plugins/cppman.lua
return {
  "madskjeldgaard/cppman.nvim",
  config = function()
	local cppman = require("cppman")
	cppman.setup()
	-- Open word under cursor in C++ manual
  end
}
