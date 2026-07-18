return {
  "yosskavo/spotify.nvim",
  build = ":UpdateRemotePlugins",
  opts = {
    notify_after_action = false,
    notification = {
      backend = "builtin",
      refresh_interval = 9999999, 
      timeout = 2000,
    }
  },
  config = function(_, opts) require("config.spotify")(_, opts) end,
}
