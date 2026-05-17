# LSP

## Stack

- `neovim/nvim-lspconfig`
- `mason-org/mason.nvim`
- `williamboman/mason-lspconfig.nvim`
- completion stack with `nvim-cmp` + sources/snippets

## Ensured servers

From `lua/config/mason-lspconfig.lua`:

- `clangd`
- `lua_ls`
- `html`
- `cssls`
- `pyright`
- `ts_ls`
- `rust_analyzer`

## LSP behavior

From `lua/config/lspconfig.lua`:

- diagnostic virtual text disabled
- custom diagnostic signs/icons
- rounded diagnostic floats
- semantic tokens disabled per-client in `on_init`

Autocmd integration (`lua/core/cmd/lsp.lua`):

- on LspAttach, semantic token provider is removed if present
- diagnostics float opens on `CursorHold`

## Keymaps (main)

- `gd`, `gD`, `<leader>D`
- `<leader>wa`, `<leader>wr`, `<leader>wl`
- `<leader>ra`
- trouble mappings under `<leader>x...`
