-- lua/config/cmp.lua
-- local function hard_mode_hint(key, alternative)
--   return function(fallback)
--     vim.notify(" 󰰍  Use '" .. alternative .. "' instead of " .. key, vim.log.levels.WARN, { title = "Discipline" })
--   end
-- end

return function(_, opts)
  local cmp = require("cmp")
  local luasnip = require("luasnip")

  require("luasnip.loaders.from_vscode").lazy_load() 

  local formatting = function(entry, vim_item)
    if entry.source.name == "path" then
      local label = entry:get_completion_item().label
      local icon, hl = require("nvim-web-devicons").get_icon(label)
      if icon then
        vim_item.kind = icon
        vim_item.kind_hl_group = hl
        return vim_item
      end
    end
    return require("lspkind").cmp_format({
      mode = "symbol",
      preset = "default",
    })(entry, vim_item)
  end

  cmp.setup({
    snippet = {
      expand = function(args) luasnip.lsp_expand(args.body) end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
      -- ['<Up>']    = cmp.mapping(hard_mode_hint('<Up>', '<C-k>'), { 'i', 'c' }),
      -- ['<Down>']  = cmp.mapping(hard_mode_hint('<Down>', '<C-j>'), { 'i', 'c' }),
      -- ['<Left>']  = cmp.mapping(hard_mode_hint('<Left>', 'h'), { 'i', 'c' }),
      -- ['<Right>'] = cmp.mapping(hard_mode_hint('<Right>', 'l'), { 'i', 'c' }),
    }),
    window = {
      completion = cmp.config.window.bordered({ border = "rounded", winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None"}),
      documentation = cmp.config.window.bordered({ border = "rounded", winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None"}),
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    }),
    formatting = {
      format = formatting,
    },
  })
end
