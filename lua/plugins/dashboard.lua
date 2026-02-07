return
{
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  -- opts = {theme = "doom"},
  config = function()
    require('config.dashboard').setup()
  end
}
