# Themes

Theme specs are in `lua/theme/*.lua`.

## Included themes

- `Yosskavo/shekai.nvim`
- `folke/tokyonight.nvim`
- `EdenEast/nightfox.nvim`
- `rebelot/kanagawa.nvim`
- `rose-pine/neovim`
- `sainnhe/gruvbox-material`
- `catppuccin/nvim`

## Theme behavior

- Lazy imports `lua/theme` specs in `lua/core/lazy.lua`.
- On first install, fallback theme is `shekai` when no selected-theme file exists in `stdpath('data')`.
- Theme switching is exposed via Switcheroo keymap `<A-t>`.

## Theme-related modules

- `lua/core/theme/colors.lua`
- `lua/core/theme/ui_mode.lua`
