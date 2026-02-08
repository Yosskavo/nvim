return {
  "lewis6991/hover.nvim",
  config = function()
    require("hover").setup({
      init = function()
        -- Require the providers you want to use
        require("hover.providers.lsp")
        require("hover.providers.gh")       -- GitHub issues/PRs
        require("hover.providers.man")      -- Linux Man pages (Great for C!)
        require("hover.providers.dictionary")
      end,
      preview_opts = {
        border = "rounded", -- Your global style
      },
      -- Whether the cursor should jump into the window automatically
      mouse_providers = { "LSP" },
      mouse_delay = 1000,
    })

    -- Keymaps
    vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
    vim.keymap.set("n", "gK", require("hover").hover_select, { desc = "hover.nvim (select)" })

    -- Mouse support (Optional: hover with your mouse)
    vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
  end,
}
