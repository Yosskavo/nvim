# Keymaps

Loaded from `lua/core/keymaps.lua` via `lua/core/key/*.lua`.

## Navigation / Windows / Tabs

- `<C-h/j/k/l>` move windows
- `<leader>sh` split horizontal
- `<leader>sv` split vertical
- `<Tab>` / `<S-Tab>` next/previous tab

## Telescope / Search

- `<leader><leader>` find files
- `<leader>fg` live grep
- `<leader>fb` buffers
- `<leader>fh` help tags
- `<leader>fH` highlights
- `<localleader>sw` spell suggestions

## Bufferline

- `<S-h>` / `<S-l>` prev/next buffer
- `<A-1..9>`, `<A-0>` go to buffer
- `<A-p>` toggle pin
- `<A-c>` close buffer
- `<leader>ba` close others

## File/Git/Terminal/Tools

- `-` open Oil float
- `<leader>lg` LazyGit
- `<A-y>` open Yazi
- `<leader>th` / `<leader>tv` / `<leader>tt` terminal open modes
- `<localleader>d` dashboard
- `<A-t>` Switcheroo (theme switch)

## LSP / Trouble / Help

- `gd`, `gD`, `<leader>D`
- `<leader>wa`, `<leader>wr`, `<leader>wl`, `<leader>ra`
- `<leader>xx`, `<leader>xX`, `<leader>xs`, `<leader>xl`, `<leader>xL`, `<leader>xQ`
- `<localleader>m` dynamic man/cppman helper
- `<leader>hn` Norminette rules popup

## Syntax helper

From `lua/core/syntax.lua`:

- `<localleader>sc` syntax-check + run current file (`c/cpp/py/lua`)
- `<localleader>e` quickfix float
