# LSP

## Stack

- `neovim/nvim-lspconfig`
- `mason-org/mason.nvim`
- `williamboman/mason-lspconfig.nvim`
- completion stack with `nvim-cmp` + sources/snippets

## Ensured servers

From `lua/config/mason-lspconfig.lua`:

- `clangd` (C / C++)
- `lua_ls` (Lua)
- `pyright` (Python)
- `bashls` (Bash / Shell)
- `gopls` (Go / Golang)
- `ols` (Odin)
- `dockerls` & `docker_compose_language_service` (Docker)
- `yamlls` (YAML / Kubernetes / CI/CD)
- `jsonls` (JSON / Schemas)
- `terraformls` (Terraform / HCL)

## LSP behavior

From `lua/config/lspconfig.lua`:

- diagnostic virtual text enabled inline at the end of the line (`virtual_text = true`) with severity icons (``, ``, `󰠠`, ``)
- custom diagnostic signs/icons
- automatic CursorHold floating windows disabled
- semantic tokens disabled per-client in `on_init`

Autocmd integration (`lua/core/cmd/lsp.lua`):

- on LspAttach, semantic token provider is removed if present

## Keymaps (main)

- `gd`, `gD`, `<leader>D`
- `<leader>wa`, `<leader>wr`, `<leader>wl`
- `<leader>ra`
- trouble mappings under `<leader>x...`
