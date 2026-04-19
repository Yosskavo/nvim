-- lua/plugins/dressing.lua
return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    input = {
      -- Set this to match the border style you use everywhere else 
      -- ("single", "rounded", or "solid")
      border = "rounded",

      -- This makes the input box slightly wider and gives it a nice title
      title_pos = "center",
      relative = "editor",

    },
    select = {
      -- This tells dressing to use Telescope to draw your SSH/HTTPS menu!
      backend = { "telescope", "builtin" },
    },
  }
}
