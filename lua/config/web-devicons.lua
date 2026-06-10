local M = {}

function M.setup()
  require('nvim-web-devicons').setup {
    -- Globally enable different highlight colors per icon
    color_icons = true,

    -- Globally enable default icons (if a file type isn't recognized)
    default = true,

    -- "Strict" ensures it checks the exact filename first (like .gitignore) 
    -- before falling back to the extension.
    strict = true,

    -- Add your personal icon overrides here
    override = {
      zsh = {
        icon = " ",
        color = "#428850",
        name = "Zsh"
      }
    },

    override_by_filename = {
      [".gitignore"] = {
        icon = " ",
        color = "#f1502f",
        name = "Gitignore"
      },
      ["Makefile"] = {
        icon = " ",
        color = "#6d8086",
        name = "Makefile"
      }
    },

    override_by_extension = {
      ["log"] = {
        icon = " ",
        color = "#81e043",
        name = "Log"
      },
      ["tpp"] = {
        icon = "󰰤 ",
        color = "#81e043",
        name = "Log"
      },
      ["ipp"] = {
        icon = "󰬐 ",
        color = "#519aba",
        name = "Cpp"
      },
      ["cpp"] = {
        icon = "󰙲 ",
        color = "#519aba",
        name = "Cpp"
      },
      ["hpp"] = {
        icon = " ",
        color = "#a074c4",
        name = "Hpp"
      }
    }
  }
end

return M
