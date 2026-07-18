-- lua/config/dial.lua
return function(_, opts)
  local augend = require("dial.augend")
  require("dial.config").augends:register_group({
    default = {
      augend.integer.alias.decimal,
      augend.integer.alias.hex,
      augend.date.alias["%Y/%m/%d"],
      augend.constant.alias.bool,
      augend.constant.alias.alpha,
      augend.constant.alias.Alpha,
    },
  })
end
