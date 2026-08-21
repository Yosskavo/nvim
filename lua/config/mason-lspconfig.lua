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
    "lua_ls",
    "pyright",
    "bashls",
    "gopls",
    "dockerls",
    "docker_compose_language_service",
    "yamlls",
    "jsonls",
    "terraformls",
  }

  -- Setup system clangd directly with full inlay hints & placeholder support
  lspconfig.clangd.setup(vim.tbl_extend("force", base, {
    cmd = {
      "clangd",
      "--background-index",
      "--clang-tidy",
      "--header-insertion=iwyu",
      "--completion-style=detailed",
      "--function-arg-placeholders",
      "--fallback-style=llvm",
    },
    initializationOptions = {
      clangdFileStatus = true,
      usePlaceholders = true,
      completeUnimported = true,
      semanticHighlighting = true,
      inlayHints = {
        designators = true,
        enabled = true,
        parameterNames = true,
        deducedTypes = true,
      },
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  }))

  -- Setup Odin Language Server (ols) if available
  if lspconfig.ols then
    lspconfig.ols.setup(base)
  end

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
              hint = {
                enable = true,
                paramType = true,
                paramName = "All",
                semicolon = "Disable",
                arrayIndex = "Disable",
              },
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
      ["gopls"] = function()
        lspconfig.gopls.setup(vim.tbl_extend("force", base, {
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              staticcheck = true,
              gofumpt = true,
              hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
              },
            },
          },
        }))
      end,
      ["pyright"] = function()
        lspconfig.pyright.setup(vim.tbl_extend("force", base, {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
              },
            },
          },
        }))
      end,
      ["yamlls"] = function()
        lspconfig.yamlls.setup(vim.tbl_extend("force", base, {
          settings = {
            yaml = {
              schemaStore = { enable = true },
              schemas = {
                kubernetes = "*.k8s.yaml",
                ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
              },
            },
          },
        }))
      end,
      ["jsonls"] = function()
        lspconfig.jsonls.setup(vim.tbl_extend("force", base, {
          settings = {
            json = {
              schemas = {
                {
                  fileMatch = { "package.json" },
                  url = "https://json.schemastore.org/package.json",
                },
                {
                  fileMatch = { "tsconfig*.json" },
                  url = "https://json.schemastore.org/tsconfig.json",
                },
              },
            },
          },
        }))
      end,
    },
  })
end

return M
