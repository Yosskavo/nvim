# Setup & Requirements

## Requirements

- Neovim `0.11+`
- Nerd Font
- `git`
- `lazygit`
- `fd` (recommended)
- `ripgrep` (recommended)
- `clangd`

Optional but used in workflows:

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
