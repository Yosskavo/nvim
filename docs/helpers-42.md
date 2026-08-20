# 42 Helpers

This config includes 42-focused helpers.

## Formatting and checks

- `lua/core/norm.lua` uses `c_formatter_42`
- `lua/core/lang/norm.lua` wraps `norminette`
- `lua/core/cmd/valgrind.lua` runs `valgrind` memory leak check (`:Valgrind` / `:Leaks`)

## UI helpers

- `lua/usr/test.lua`: floating Norminette cheat-sheet popup
- `lua/usr/man.lua`: floating manual-page popup

## Keymaps

- `<localleader>fn` apply 42 formatter (`c_formatter_42`)
- `<localleader>fh` insert 42 header
- `<leader>hn` open Norminette rules cheat-sheet popup
- `<leader>hc` run live Norminette check on current file
- `<A-o>` / `<leader>cs` switch between Header and Source (`.c` $\leftrightarrow$ `.h`, `.cpp` $\leftrightarrow$ `.hpp`)
- `<leader>lv` / `:Valgrind` / `:Leaks` run Valgrind memory leak checker
- `<localleader>m` contextual manual helper for C/C++
