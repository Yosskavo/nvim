-- lua/config/hover.lua
return function(_, opts)
  require("hover").config({
    providers = {
      "hover.providers.lsp",
      "hover.providers.gh",
      "hover.providers.man",
      "hover.providers.dictionary",
    },
    preview_opts = { border = "rounded" },
    mouse_providers = { "LSP" },
    mouse_delay = 1000,
  })
end
