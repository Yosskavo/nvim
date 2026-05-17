# Commands & Autocommands

## User commands

- `:Clone`
  - interactive clone helper (owner, repo, protocol, path)
- `:GenMake`
  - generate Makefile in a selected directory
- `:NewProject`
  - interactive project bootstrapper (language, build system, git options)

## Active autocommands

- autosave on `InsertLeave` + `TextChanged`
- treesitter start on `FileType`
- LSP attach semantic token disable
- diagnostics float on `CursorHold`
- Oil save on `InsertLeave` for `oil://*`
- auto project root `cd` on `BufEnter`
- Screenkey on `VimEnter`
- spell enable for `c/cpp/lua/python`
- fold disable in UI filetypes (`oil`, `alpha`, `dashboard`, `norg`, `TelescopePrompt`)
- notify window close maps (`q`, `<Esc>`)
- dashboard redraw on `VimResized`
- post-`LazyInstall` dashboard + notify

## Note

- `lua/core/cmd/theme.lua` exists but is currently not loaded by `lua/core/autocmd.lua`.
