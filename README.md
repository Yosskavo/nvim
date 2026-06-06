# Inverted-Nvim

A Lua-first Neovim configuration focused on:

- modern UI/UX
- C/C++ + Python workflows
- 42-school helpers (Norminette-oriented formatting/rules utilities)
- project/bootstrap tooling
- searchable, modular keymaps and command setup

## Requirements

- Neovim `0.12+`
- Nerd Font
- `git`
- `lazygit`
- `fd` (recommended)
- `ripgrep` (recommended)
- `clangd`

Optional but used by some workflows:

- `gcc`, `g++`
- `python3`, `flake8`
- `luac`, `luajit`
- `c_formatter_42`, `norminette`
- `make`

## Install

```bash
cd ~/.config
mv nvim nvim-backup   # optional

git clone https://github.com/Yosskavo/nvim.git
# or
git clone git@github.com:Yosskavo/nvim.git
```

Then open Neovim and allow lazy.nvim to install plugins.

## Quick Start

- Leader key: `<Space>`
- Local leader: `\\`
- Find files: `<leader><leader>`
- Live grep: `<leader>fg`
- File explorer (Oil float): `-`
- LazyGit: `<leader>lg`
- Open dashboard: `<localleader>d` (default: `\\d`)
- Theme switcher: `<A-t>`

## Main Features

- Modular core architecture (`lua/core`, `lua/core/key`, `lua/core/cmd`)
- LSP + Mason + nvim-cmp stack
- Telescope + fzf-native + live_grep_args
- Dashboard, bufferline, lualine, noice, notify
- Troubleshooting UI via Trouble and diagnostics floats
- Project and Makefile generators (`:NewProject`, `:GenMake`)
- Interactive repository clone helper (`:Clone`)

## Full Documentation

For complete documentation (all keymaps, commands, autocommands, plugin inventory, and architecture), read:

- [`docs/README.md`](./docs/README.md)

## Next Target

- [ ] A big update for UI 
- [ ] A integration for AI
- [x] A notify for up-coming updates
