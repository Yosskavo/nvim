return {
  "bxrne/pomo.nvim",
  keys = {
    { "<leader>ps", function() require("pomo").start() end, desc = "Start Pomodoro" },
    { "<leader>pt", function() require("pomo").stop() end, desc = "Stop Pomodoro" },
  },
  config = function()
    require("pomo").setup({
      session_minutes = 25, -- Focus duration
      break_minutes = 5,   -- Break duration
    })
  end
}
