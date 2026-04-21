return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- 1. ADD THIS LINE: This gives you thousands of pre-made snippets for HTML/CSS/JS
    "rafamadriz/friendly-snippets", 
    
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    {
      "windwp/nvim-autopairs",
      config = function()
        require("nvim-autopairs").setup {}
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end,
    },
  },
  config = function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    
    -- This will now actually load the friendly-snippets you added above
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
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      window = {
        completion = cmp.config.window.bordered({ border = "rounded", winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None"}),
        documentation = cmp.config.window.bordered({ border = "rounded", winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None"}),
      },
      
      -- 2. UPDATE THIS BLOCK: Move luasnip up and fix the path source
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- Snippets should be highly prioritized
        { name = "buffer" },  -- Then words in the current file
        { name = "path" },    -- Then file paths (removed the restrictive quote pattern)
      }),
      
      formatting = {
        format = formatting,
      },
    })
  end,
}
