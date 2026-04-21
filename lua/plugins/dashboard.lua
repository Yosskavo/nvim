return
{
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  priority = 1000,
  -- opts = {theme = "doom"},
  config = function()
    require('config.dashboard').setup()
  end
}
