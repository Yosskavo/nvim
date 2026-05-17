return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    -- Remove the string here if you already have it installed globally elsewhere,
    -- or keep it here so Lazy knows Neo-tree relies on it. It won't break anything.
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    { "<A-e>", "<cmd>Neotree toggle left<cr>", desc = "Explorer Neo-tree" },
  },
  opts = {
    close_if_last_window = true,
    popup_border_style = "rounded",

    -- This block ensures Neo-tree explicitly requests icons from web-devicons
    default_component_configs = {
      container = {
        enable_character_fade = true
      },
      indent = {
        with_expanders = true,
        expander_collapsed = "",
        expander_expanded = "",
      },
      icon = {
        folder_closed = " ",
        folder_open = " ",
        folder_empty = "󰜮",
        -- CRUCIAL: This tells Neo-tree to fetch your customized file icons!
        default = "󰈚 ",
        highlight = nil,
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
      },
    },

    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = true,
      },
      follow_current_file = {
        enabled = true,
      },
      use_libuv_file_watcher = true,
    },

    window = {
      width = 30,
      mappings = {
        ["<space>"] = "none",
        ["l"] = "open",
        ["h"] = "close_node",
      },
    },
  },
}
