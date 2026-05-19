return {
  "stsewd/spotify.nvim",
  build = ":updateremoteplugins",
  opts = {
	  spotify_path = "com.spotify.Client",
  },
  config = function()
    require("spotify").setup()
  end,
  init = function()
    -- optional mappings.
    vim.keymap.set("n", "<leader>Ss", ":spotify play/pause<cr>", { silent = true })
    vim.keymap.set("n", "<leader>Sj", ":spotify next<cr>", { silent = true })
    vim.keymap.set("n", "<leader>Sk", ":spotify prev<cr>", { silent = true })
    vim.keymap.set("n", "<leader>So", ":spotify show<cr>", { silent = true })
    vim.keymap.set("n", "<leader>Sc", ":spotify status<cr>", { silent = true })
  end,
}
