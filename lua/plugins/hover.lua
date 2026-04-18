return {
  "lewis6991/hover.nvim",
  config = function()
    -- 1. Call config() instead of setup()
    require("hover").config({
      
      -- 2. Use the 'providers' list instead of the 'init' block
      providers = {
        "hover.providers.lsp",
        "hover.providers.gh",         -- GitHub issues/PRs
        "hover.providers.man",        -- Linux Man pages (Great for C!)
        "hover.providers.dictionary",
      },
      
      preview_opts = {
        border = "rounded", -- Your global style
      },
      
      -- Whether the cursor should jump into the window automatically
      mouse_providers = { "LSP" },
      mouse_delay = 1000,
    })

    -- Keymaps
    local hover = require("hover")
    
    -- 3. Use the newly renamed functions: .open and .select
    vim.keymap.set("n", "K", hover.open, { desc = "hover.nvim" })
    vim.keymap.set("n", "gK", hover.select, { desc = "hover.nvim (select)" })

    -- Mouse support 
    -- (Note: If you eventually see a warning here too, the author likely renamed it to hover.mouse)
    vim.keymap.set("n", "<MouseMove>", hover.hover_mouse, { desc = "hover.nvim (mouse)" })
  end,
}
