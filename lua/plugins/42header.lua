return {
  "Diogo-ss/42-header.nvim",
  cmd = { "Stdheader" },
  keys = { "<localleader>fh", "<leader>nh" },
  opts = {
    default_map = true,
    auto_update = true, -- Update header when saving.
    user = os.getenv("USER"), -- Your user.
    mail = os.getenv("MAIL"), -- Your mail.
    -- add other options.
  },
  config = function(_, opts)
    require("42header").setup(opts)
  end,
}
