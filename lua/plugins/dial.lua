return {
  "monaqa/dial.nvim",
  keys = {
		{ "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
		{ "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
		{ "g<C-a>", function() return require("dial.map").inc_gvisual() end, expr = true, mode = "v", desc = "Increment (Visual Block)" },
		{ "g<C-x>", function() return require("dial.map").dec_gvisual() end, expr = true, mode = "v", desc = "Decrement (Visual Block)" },
	},
  config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group({
      default = {
        augend.integer.alias.decimal, -- normal numbers
        augend.integer.alias.hex,     -- hex numbers
        augend.date.alias["%Y/%m/%d"], -- dates
        augend.constant.alias.bool,    -- true/false
		augend.constant.alias.alpha,   -- Increments lowercase: a, b, c...
		augend.constant.alias.Alpha,
      },
    })
  end,
}
