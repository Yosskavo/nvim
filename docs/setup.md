# Setup & Requirements

## Requirements

- Neovim `0.11+`
- Nerd Font (v3+)
- `git`
- `lazygit`
- `yazi`
- `fd` & `ripgrep`
- `clangd` (system package)
- `gcc`, `g++`, `make`

Optional language & dev tools:

- `valgrind` (Memory leak checking via `:Valgrind` / `<leader>lv`)
- `c_formatter_42` (`pipx install c_formatter_42`)
- `norminette` (`pipx install norminette`)
- `go` / `gopls` (Go development)
- `ols` / `odin` (Odin development)
- `docker` / `docker-compose` (DevOps)
- `terraform` / `tofu` (Infrastructure as Code)
- `python3`, `flake8`

## Install

```bash
cd ~/.config
mv nvim nvim-backup   # optional
git clone https://github.com/Yosskavo/nvim.git
# or
git clone git@github.com:Yosskavo/nvim.git
```

Open Neovim and let lazy.nvim install plugins.

## Core defaults (from `lua/core/option.lua`)

- true color, line numbers + relative numbers
- system clipboard (`unnamedplus`)
- tab settings: `tabstop=4`, `shiftwidth=4`, no `expandtab`
- spell enabled (`en_us`)
- `mapleader = <Space>`, `maplocalleader = \\`
- swapfile disabled, persistent undo enabled
- global statusline (`laststatus=3`)
- semantic tokens disabled globally
