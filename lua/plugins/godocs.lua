return {
  "fredrikaverpil/godoc.nvim",
  version = "*",
  dependencies = {
    { "nvim-telescope/telescope.nvim" }, -- optional
    { "echasnovski/mini.pick" }, -- optional
    { "ibhagwan/fzf-lua" }, -- optional
  },
  build = "go install github.com/lotusirous/gostdsym/stdsym@latest", -- optional
}
