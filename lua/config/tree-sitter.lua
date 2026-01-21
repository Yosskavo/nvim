local parsers_module = require("nvim-treesitter.parsers")

-- Parsers we want to auto-install
local parsers = {
  "c",
  "cpp",
  "python",
  "lua",
  "vim",
  "vimdoc",
  "dockerfile",
  "yaml",
  "json",
  "markdown",
  "markdown_inline",
}

-- Install missing parsers and wait, silently
pcall(function()
  parsers_module.install(parsers):wait(300000)
end)
