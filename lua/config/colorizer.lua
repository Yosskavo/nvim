local M = {}

function M.setup()
	require("colorizer").setup({
		user_default_options = {
			names = false,
		},
		RGB = true, -- #RGB hex codes
		RGBA = true, -- #RGBA hex codes
		RRGGBB = true, -- #RRGGBB hex codes
		RRGGBBAA = true, -- #RRGGBBAA hex codes
		AARRGGBB = false, -- 0xAARRGGBB hex codes
		-- Virtualtext character to use
		virtualtext = " ",
		-- Display virtualtext inline with color.  boolean|'before'|'after'.  True sets to 'after'
		virtualtext_inline = true,

	})
end

return M
