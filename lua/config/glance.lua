local glance = require('glance')
local M = {}

---@diagnostic disable-next-line: missing-fields

function M.setup()
glance.setup({
 height = 18, -- Height of the window
  zindex = 45,
  -- By default glance will open open the window in the center of the screen
  border = {
    enable = true,
    top_char = '―',
    bottom_char = '―',
  },

  list = {
    position = 'right', -- Where the list of results appears (right or left)
    width = 33, -- 33% width relative to the active window, min 0.1, max 0.5
  },

  theme = {
    enable = true, 
    mode = 'auto', -- Automatically detect light/dark
  },

  mappings = {
    list = {
      ['j'] = glance.actions.next, -- Bring the cursor to the next item
      ['k'] = glance.actions.previous, -- Bring the cursor to the previous item
      ['<Down>'] = glance.actions.next,
      ['<Up>'] = glance.actions.previous,
      ['<Tab>'] = glance.actions.next_location, -- Jump to next location in the file
      ['<S-Tab>'] = glance.actions.previous_location, 
      ['<C-v>'] = glance.actions.jump_vsplit, -- Open the file in a vertical split
      ['<C-x>'] = glance.actions.jump_split, -- Open the file in a horizontal split
      ['<CR>'] = glance.actions.jump, -- Jump to the selected result and close Glance
      ['o'] = glance.actions.jump,
      ['q'] = glance.actions.close,
      ['<Esc>'] = glance.actions.close,
    },
    preview = {
      ['q'] = glance.actions.close,
      ['<Esc>'] = glance.actions.close,
      ['<Tab>'] = glance.actions.next_location,
      ['<S-Tab>'] = glance.actions.previous_location,
    },
  },
  
  -- Hooks allow you to run actions before/after glance opens
  hooks = {
    -- before_open = function(results, open, jump, method)
    --   -- If there is only ONE result, just jump directly to it instead of opening the UI
    --   if #results == 1 then
    --     jump(results[1]) 
    --   else
    --     open(results) 
    --   end
    -- end,
  },
})
end

return M
