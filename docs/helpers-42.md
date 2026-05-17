# 42 Helpers

This config includes 42-focused helpers.

## Formatting and checks

- `lua/core/norm.lua` uses `c_formatter_42`
- `lua/core/lang/norm.lua` wraps `norminette`

## UI helpers

- `lua/usr/test.lua`: floating Norminette cheat-sheet popup
- `lua/usr/man.lua`: floating manual-page popup

## Keymaps

- `<localleader>fn` apply 42 formatter
- `<localleader>fh` insert 42 header
- `<leader>hn` open Norminette rules popup
- `<localleader>m` contextual manual helper for C/C++
