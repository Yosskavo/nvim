# Overview

This is a modular Lua Neovim configuration.

## Entrypoint

- `init.lua`

It loads:

- `lua/core/option.lua`
- `lua/core/lazy.lua`
- `lua/core/keymaps.lua`
- `lua/core/syntax.lua`
- `lua/core/autocmd.lua`

## Structure

- `lua/core/*`: core behavior
- `lua/core/key/*`: keymaps by feature
- `lua/core/cmd/*`: custom command/autocmd modules
- `lua/config/*`: plugin setup functions
- `lua/plugins/*`: plugin specs
- `lua/theme/*`: theme specs
- `lua/usr/*`: helper popups/tools

## Plugin loading

From `lua/core/lazy.lua`:

- bootstraps `folke/lazy.nvim`
- imports plugin specs from `lua/plugins` and `lua/theme`
- first install fallback theme is `shekai` when theme selection file is missing in `stdpath('data')`
- custom plugins default to `lazy = false`
