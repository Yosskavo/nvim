# Themes

Theme specs are in `lua/theme/*.lua`.

## Included themes

- `yosskavo/shekai.nvim` (Custom dark transparent)
- `folke/tokyonight.nvim` (`tokyonight`, `tokyonight-night`, `tokyonight-storm`, `tokyonight-moon`, `tokyonight-day`)
- `EdenEast/nightfox.nvim` (`nightfox`, `nordfox`, `duskfox`, `terafox`, `carbonfox`, `dawnfox`, `dayfox`)
- `rebelot/kanagawa.nvim` (`kanagawa`, `kanagawa-wave`, `kanagawa-dragon`, `kanagawa-lotus`)
- `rose-pine/neovim` (`rose-pine`, `rose-pine-main`, `rose-pine-moon`, `rose-pine-dawn`)
- `sainnhe/gruvbox-material` (`gruvbox-material`)
- `catppuccin/nvim` (`catppuccin`, `catppuccin-mocha`, `catppuccin-macchiato`, `catppuccin-frappe`, `catppuccin-latte`)
- `scottmckendry/cyberdream.nvim` (`cyberdream`, `cyberdream-light`, `cyberdream-muted`)
- `Mofiqul/dracula.nvim` (`dracula`, `dracula-soft`)
- `nyoom-engineering/oxocarbon.nvim` (`oxocarbon`)
- `neanias/everforest-nvim` (`everforest`)
- `navarasu/onedark.nvim` / `olimorris/onedarkpro.nvim` (`onedark`, `onedark_dark`, `onedark_vivid`, `onelight`)

## Theme behavior

- Lazy imports `lua/theme` specs in `lua/core/lazy.lua`.
- Switcheroo keymap `<A-t>` opens a Telescope picker containing **only installed themes** (all legacy pre-installed Neovim defaults like `blue`, `desert`, `delek`, `elflord` are automatically filtered out).
- Live preview while navigating themes in the picker.
- Theme choice is automatically persisted across restarts in `stdpath('data') .. "/Switcheroo/SelectedTheme"`.
- Dashboard footer dynamically reflects the active theme.
