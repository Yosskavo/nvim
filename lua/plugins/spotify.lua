return {
  "yosskavo/spotify.nvim", -- (or "stsewd/spotify.nvim" if you haven't swapped to your fork yet)
  build = ":UpdateRemotePlugins",
  opts = {
    -- 1. Stop popping up a notification every time you hit play, pause, or next
    notify_after_action = false,
    
    notification = {
      -- 2. Downgrade from the big floating cards to Neovim's standard text echo
      backend = "builtin",
      
      -- 3. The Kill Switch: Set the animation timer to run once every 115 days 
      -- instead of every 1 second. This stops the spam loop completely.
      refresh_interval = 9999999, 
      
      -- 4. Make it disappear after 2 seconds when you do ask for the status
      timeout = 2000,
    }
  },
  config = function(_, opts)
    require("spotify").setup(opts)
  end,
  init = function()
    vim.keymap.set("n", "<leader>Ss", ":Spotify play/pause<CR>", { silent = true })
    vim.keymap.set("n", "<leader>Sj", ":Spotify next<CR>", { silent = true })
    vim.keymap.set("n", "<leader>Sk", ":Spotify prev<CR>", { silent = true })
    vim.keymap.set("n", "<leader>Sc", ":Spotify status<CR>", { silent = true })
  end,
}
