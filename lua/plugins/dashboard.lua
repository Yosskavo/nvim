return
{
  'nvimdev/dashboard-nvim',
  lazy = false,
  priority = 1000,
  -- opts = {theme = "doom"},
  config = function()
    require('config.dashboard').setup()
  end
}
