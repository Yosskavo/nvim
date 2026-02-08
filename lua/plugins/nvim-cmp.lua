return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "onsails/lspkind.nvim",
    "nvim-tree/nvim-web-devicons",
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
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
      }),
      window = {
        completion = cmp.config.window.bordered({ border = "rounded" }),
        documentation = cmp.config.window.bordered({ border = "rounded" }),
      },
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "path", keyword_pattern = [["][^"]*"]] },
        { name = "buffer" },
        { name = "luasnip" },
      }),
      formatting = {
        format = formatting,
      },
    })
  end,
}
