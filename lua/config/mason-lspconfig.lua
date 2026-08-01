local M = {}

function M.setup()
  local mason_lspconfig = require("mason-lspconfig")
  local lspconfig = require("lspconfig")
  local base = require("config.lspconfig").config

  local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if has_cmp then
    base.capabilities = vim.tbl_deep_extend("force", base.capabilities or {}, cmp_nvim_lsp.default_capabilities())
  end

  local servers = {
    "clangd",
    "lua_ls",
    "pyright",
    "bashls",
  }

  mason_lspconfig.setup({
    ensure_installed = servers,
    handlers = {
      function(server_name)
        lspconfig[server_name].setup(base)
      end,
      ["lua_ls"] = function()
        lspconfig.lua_ls.setup(vim.tbl_extend("force", base, {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
              },
            },
          },
        }))
      end,
      ["clangd"] = function()
        lspconfig.clangd.setup(vim.tbl_extend("force", base, {
          cmd = { "clangd", "--background-index" },
          filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
        }))
      end,
      ["bashls"] = function()
        lspconfig.bashls.setup(vim.tbl_extend("force", base, {
          cmd = { "bash-language-server", "start" },
          filetypes = { "sh", "bash" },
          settings = {
            bashIde = {
              globPattern = "**/*@(.sh|.inc|.bash|.command)",
            },
          },
        }))
      end,
    },
  })
end

return M

