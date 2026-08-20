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
- `<leader>tp` / `:TP` toggle transparency (or `:TP on` / `:TP off`)

## Harpoon (Fast File Pinning)

- `<leader>a` add current file to Harpoon
- `<C-e>` / `<leader>he` toggle Harpoon quick menu
- `<leader>1` .. `<leader>4` jump directly to Harpoon slot 1 to 4
- `<leader>hk` / `<leader>hj` cycle previous / next Harpoon file

## Make.nvim (Makefile Runner)

- `<leader>mm` Makefile target picker (Telescope)
- `<leader>mt` toggle Make terminal
- `<leader>mr` run default Make target

## LSP / Trouble / Code Helpers

- `gd`, `gD`, `<leader>D` go to definition/declaration/type
- `<leader>ca` LSP Code Actions (auto imports, quickfixes)
- `<leader>ti` toggle LSP Inlay Hints
- `<A-o>` / `<leader>cs` switch between Header and Source (`.c` $\leftrightarrow$ `.h`, `.cpp` $\leftrightarrow$ `.hpp`)
- `<leader>lv` / `:Valgrind` / `:Leaks` run Valgrind memory leak checker
- `<leader>wa`, `<leader>wr`, `<leader>wl`, `<leader>ra`
- `<leader>xx`, `<leader>xX`, `<leader>xs`, `<leader>xl`, `<leader>xL`, `<leader>xQ`
- `<localleader>m` dynamic man/cppman helper
- `<leader>cm` / `<leader>cM` CPPMan word/search
- `<leader>hn` Norminette rules cheat-sheet
- `<leader>hc` Live Norminette check
- `<localleader>fn` Apply 42 C formatter
- `<localleader>fh` Insert 42 standard header

## Syntax helper

From `lua/core/syntax.lua`:

- `<localleader>sc` syntax-check + run current file (`c/cpp/py/lua`)
- `<localleader>e` quickfix float
