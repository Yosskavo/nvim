return {
  "MrSloth-dev/Switcheroo.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local switcheroo = require("Switcheroo")
    switcheroo.setup({
      default_theme = "kanagawa",
      persist = true,
    })

    local builtin_themes = {
      blue = true,
      darkblue = true,
      default = true,
      delek = true,
      desert = true,
      elflord = true,
      evening = true,
      habamax = true,
      industry = true,
      koehler = true,
      lunaperche = true,
      morning = true,
      murphy = true,
      pablo = true,
      peachpuff = true,
      quiet = true,
      retrobox = true,
      ron = true,
      shine = true,
      slate = true,
      sorbet = true,
      torte = true,
      unokai = true,
      vaporwave = true,
      vim = true,
      wildcharm = true,
      zaibatsu = true,
      zellner = true,
      ["catppuccin-nvim"] = true,
    }

    local pickers = require("telescope.pickers")
    local sorters = require("telescope.sorters")
    local finders = require("telescope.finders")
    local previewers = require("telescope.previewers")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local filesystem = require("Switcheroo.filesystem")

    local preview_code = {
      "local function example(input_list)",
      "    -- This function processes a list of numbers",
      "    local total_sum = 0",
      "",
      "    for i, value in ipairs(input_list) do",
      "        if value > 0 then",
      "            total_sum = total_sum + value",
      "        else",
      "            print('Skipping negative value:', value)",
      "        end",
      "    end",
      "",
      "    local result_table = {",
      "        sum = total_sum,",
      "        average = #input_list > 0 and (total_sum / #input_list) or 0",
      "    }",
      "    return result_table",
      "end",
    }

    local function get_installed_colorschemes()
      local all = vim.fn.getcompletion("", "color")
      local filtered = {}
      for _, name in ipairs(all) do
        if not builtin_themes[name] then
          table.insert(filtered, name)
        end
      end
      table.sort(filtered)
      return filtered
    end

    switcheroo.select_theme = function(opts)
      local themes = get_installed_colorschemes()
      local initial_colorscheme = vim.g.colors_name

      pickers.new(opts or {}, {
        prompt_title = "Installed Themes",
        finder = finders.new_table({
          results = themes,
          entry_maker = function(entry)
            return {
              value = entry,
              display = entry,
              ordinal = entry,
            }
          end,
        }),
        sorter = sorters.get_fzy_sorter(opts),
        previewer = previewers.new_buffer_previewer({
          define_preview = function(self, entry)
            local bufnr = self.state.bufnr
            local preview_content = {
              "Theme: " .. entry.value,
              "─────────────────────────────",
              "",
            }
            for _, line in ipairs(preview_code) do
              table.insert(preview_content, line)
            end
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, preview_content)
            pcall(vim.api.nvim_set_option_value, "filetype", "lua", { buf = bufnr })
            pcall(vim.cmd.colorscheme, entry.value)
          end,
        }),
        attach_mappings = function(prompt_bufnr, map)
          local function apply_colorscheme()
            local selection = action_state.get_selected_entry()
            if selection then
              local file = io.open(filesystem.file, "w")
              if file then
                file:write(selection.value)
                file:close()
              end
              pcall(vim.cmd.colorscheme, selection.value)
            end
          end

          local function reset_colorscheme()
            if initial_colorscheme then
              pcall(vim.cmd.colorscheme, initial_colorscheme)
            end
            actions.close(prompt_bufnr)
          end

          map("i", "<C-c>", reset_colorscheme)
          map("n", "<C-c>", reset_colorscheme)
          map("n", "<ESC>", reset_colorscheme)

          actions.select_default:replace(function()
            apply_colorscheme()
            actions.close(prompt_bufnr)
          end)
          return true
        end,
      }):find()
    end
  end,
}
