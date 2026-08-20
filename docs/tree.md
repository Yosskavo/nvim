# Tree / File Navigation

This config includes multiple tree/file navigation experiences.

## Oil (default file explorer)

- plugin: `stevearc/oil.nvim`
- setup: `lua/config/oil.lua`
- keymap: `-` opens Oil in float mode
- autocommand saves Oil changes on `InsertLeave` for `oil://*`

## Yazi (terminal file manager)

- plugin: `mikavilpas/yazi.nvim`
- keymap: `<A-y>` opens Yazi file manager

## Project root interaction

- `lua/core/cmd/root.lua` auto-detects project roots on `BufEnter`
- markers: `.git`, `Makefile`, `package.json`, `.sln`
- updates current working directory automatically

## Related tools

- Yazi integration (`mikavilpas/yazi.nvim`, `<A-y>`)
- Telescope finders (`<leader><leader>`, `<leader>fg`, etc.)
