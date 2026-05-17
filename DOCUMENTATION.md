# Neovim Configuration Documentation

This document describes the configuration in `/home/runner/work/nvim/nvim`.

## 1) Overview

This config is a Lua-based Neovim setup that loads:

- core editor options
- plugin manager bootstrapping (`lazy.nvim`)
- keymaps split by feature
- syntax/language helpers
- custom autocommands
- plugin specs (`lua/plugins/*.lua`)
- theme specs (`lua/theme/*.lua`)

Entrypoint:

- `init.lua`

Loaded core modules:

- `lua/core/option.lua`
- `lua/core/lazy.lua`
- `lua/core/keymaps.lua`
- `lua/core/syntax.lua`
- `lua/core/autocmd.lua`

## 2) Requirements

Required/recommended tools used by this config:

- Neovim `v0.11+`
- Nerd Font (icons)
- `git`
- `lazygit`
- `fd` (recommended for fuzzy finding)
- `ripgrep` (recommended for Telescope grep / todo search)
- `clangd` (C/C++ LSP)
- `gcc` / `g++` (syntax checks for C/C++)
- `python3`
- `flake8` (Python checks)
- `luac`, `luajit` (Lua checks/runs)
- `c_formatter_42` (42 formatting helper)
- `norminette` (42 norm checks helper)
- `make` (for plugins requiring build steps like `telescope-fzf-native`)

## 3) Installation

```bash
cd ~/.config
mv nvim nvim-backup   # optional backup

git clone https://github.com/Yosskavo/nvim.git
# or: git clone git@github.com:Yosskavo/nvim.git
```

Open Neovim and let `lazy.nvim` install plugins.

## 4) Plugin Loading and Theme Behavior

File: `lua/core/lazy.lua`

- Bootstraps `folke/lazy.nvim` if missing.
- Imports plugin specs from:
  - `lua/plugins`
  - `lua/theme`
- Uses a first-install theme fallback:
  - if `stdpath('data')/SelectedTheme` does not exist, startup colorscheme defaults to `shekai`.
- Plugin defaults:
  - `lazy = false` for custom plugins
  - `version = false` (track latest commits)
- Plugin update checker is disabled.

## 5) Core Editor Defaults

File: `lua/core/option.lua`

- true color enabled (`termguicolors`)
- hidden end-of-buffer chars
- system clipboard integration (`unnamedplus`)
- tabs: width=4, tabstop=4, no expandtab
- line numbers + relative numbers
- spell checking enabled (`en_us`)
- cursorline enabled
- leader keys:
  - `mapleader = <Space>`
  - `maplocalleader = \\`
- swapfile disabled
- global statusline (`laststatus=3`)
- persistent undo (`undofile`)
- semantic tokens disabled globally (`vim.lsp.semantic_tokens.enable = false`)
- `updatetime = 0`
- custom `guicursor`

## 6) Keymaps

Keymaps are split under `lua/core/key/*.lua` and loaded by `lua/core/keymaps.lua`.

### 6.1 Window and Tabs

- `<C-h/j/k/l>`: move between windows
- `<leader>sh`: horizontal split
- `<leader>sv`: vertical split
- `<Tab>` / `<S-Tab>`: next/previous tab

### 6.2 Bufferline

- `<S-h>` / `<S-l>`: previous/next buffer
- `<A-<>` / `<A->>`: move buffer left/right
- `<A-1..9>`, `<A-0>`: jump to buffer index
- `<A-p>`: pin/unpin buffer
- `<A-c>`: close current buffer
- `<C-p>`: pick buffer
- `<C-S-p>`: pick buffer to close
- `<Space>bb`: sort by tabs
- `<Space>bn`: sort by extension
- `<Space>bd`: sort by directory
- `<leader>ba`: close other buffers

### 6.3 Editing / Text

- `<A-j>` / `<A-k>` in normal/insert/visual: move lines or blocks up/down

### 6.4 Search / Telescope / Todo

- `<leader><leader>`: find files
- `<leader>fg`: live grep
- `<leader>fb`: buffers
- `<leader>fh`: help tags
- `<leader>fH`: FzfLua highlights
- `<localleader>sw`: spell suggestions
- `<leader>tf`: Todo list (loclist)
- `<leader>ft`: Todo Telescope picker

### 6.5 File Explorer / Terminal / Git / Tools

- `-`: open Oil in floating mode
- `<leader>th`: terminal horizontal split
- `<leader>tv`: terminal vertical split
- `<leader>tt`: terminal tab
- `<leader>lg`: LazyGit
- `<A-y>`: open Yazi
- `<localleader>tt`: Typr
- `<localleader>ts`: Typr stats
- `<localleader>d`: open Dashboard

### 6.6 LSP / Diagnostics / Help

- `gd`: go to definition
- `gD`: go to declaration
- `<leader>D`: type definition
- `<leader>wa`: add workspace folder
- `<leader>wr`: remove workspace folder
- `<leader>wl`: list workspace folders
- `<leader>ra`: rename symbol
- `<leader>xx`: Trouble diagnostics
- `<leader>xX`: Trouble diagnostics (current buffer)
- `<leader>xs`: Trouble symbols
- `<leader>xl`: Trouble LSP view
- `<leader>xL`: Trouble loclist
- `<leader>xQ`: Trouble quickfix
- `<i><A-S-k>` / `<v><S-k>`: hover
- `<localleader>m`: context help (cppman/man by filetype)
- `<leader>hn`: open Norminette rules popup

### 6.7 Notifications / Misc

- `<leader>wn`: jump to latest notification window
- `<leader>nc`: clear notifications
- `<leader>fn`: new file in split
- `<Esc>`: clear search highlight
- `<A-t>`: open theme switcher (`Switcheroo`)

### 6.8 Syntax check and run helper

From `lua/core/syntax.lua`:

- `<localleader>sc`: syntax-check then run current file for `c/cpp/py/lua`
- `<localleader>e`: open/close quickfix float

## 7) User Commands

Defined custom user commands:

- `:Clone`
  - interactive GitHub clone helper (SSH/HTTPS + destination)
- `:GenMake`
  - generate Makefile in chosen directory for C/C++/Python
- `:NewProject`
  - interactive project bootstrapper:
    - C/C++/Python templates
    - optional Make/CMake
    - optional existing GitHub repo cloning
    - optional auto-open project directory

## 8) Autocommands

Custom autocommands are loaded via `lua/core/autocmd.lua`.

### Active behavior

- Autosave on `InsertLeave` and `TextChanged`
- Start Treesitter highlighting on `FileType`
- LSP attach:
  - disable semantic tokens per client
- `CursorHold`:
  - show diagnostics float automatically
- Oil buffers:
  - save on `InsertLeave`
- Auto `cd` to detected project root on `BufEnter` (`.git`, `Makefile`, `package.json`, `.sln`)
- Start `Screenkey` on `VimEnter`
- Force spell checking for `c/cpp/lua/python`
- Disable folding in specific UI buffers (`oil`, `alpha`, `dashboard`, `norg`, `TelescopePrompt`)
- Notification buffers (`filetype=notify`):
  - map `q` and `<Esc>` to close
- Dashboard redraw on `VimResized`
- On `LazyInstall` event:
  - try opening Dashboard
  - show "Plugins Synced" notification

### Present but currently not loaded

- `lua/core/cmd/theme.lua` exists to persist selected colorscheme to `lua/core/theme_user.lua`, but it is not required in `lua/core/autocmd.lua`.

## 9) LSP, Mason, and Language Support

### LSP servers ensured

From `lua/config/mason-lspconfig.lua`:

- `clangd`
- `lua_ls`
- `html`
- `cssls`
- `pyright`
- `ts_ls`
- `rust_analyzer`

### LSP UI behavior

From `lua/config/lspconfig.lua`:

- virtual text disabled
- custom diagnostic signs/icons
- rounded diagnostic floating windows
- semantic tokens disabled

### Treesitter parsers auto-installed

From `lua/config/tree-sitter.lua`:

- c, cpp, python, lua, vim, vimdoc, dockerfile, yaml, json, markdown, markdown_inline

## 10) Plugin Inventory

### Core UX / UI

- `nvimdev/dashboard-nvim`
- `nvim-lualine/lualine.nvim`
- `folke/which-key.nvim`
- `rcarriga/nvim-notify`
- `folke/noice.nvim`
- `stevearc/dressing.nvim`
- `akinsho/bufferline.nvim`
- `nvim-tree/nvim-web-devicons`
- `catgoose/nvim-colorizer.lua`
- `stevearc/oil.nvim`
- `folke/trouble.nvim`
- `NStefan002/screenkey.nvim`
- `xiyaowong/transparent.nvim`
- `kevinhwang91/nvim-ufo`
- `nvim-treesitter/nvim-treesitter-context`

### Search / Navigation / File discovery

- `nvim-telescope/telescope.nvim`
- `nvim-telescope/telescope-fzf-native.nvim`
- `nvim-telescope/telescope-live-grep-args.nvim`
- `ibhagwan/fzf-lua`
- `MagicDuck/grug-far.nvim`
- `ahmedkhalf/project.nvim`
- `mikavilpas/yazi.nvim`
- `folke/flash.nvim`
- `sudormrfbin/cheatsheet.nvim`

### LSP / Completion / Snippets

- `neovim/nvim-lspconfig`
- `mason-org/mason.nvim`
- `williamboman/mason-lspconfig.nvim`
- `hrsh7th/nvim-cmp`
- `L3MON4D3/LuaSnip`
- `saadparwaiz1/cmp_luasnip`
- `hrsh7th/cmp-nvim-lsp`
- `hrsh7th/cmp-buffer`
- `hrsh7th/cmp-path`
- `onsails/lspkind.nvim`
- `rafamadriz/friendly-snippets`
- `ray-x/lsp_signature.nvim`
- `folke/lazydev.nvim`

### Git / Dev workflow

- `lewis6991/gitsigns.nvim`
- `kdheepak/lazygit.nvim`
- `folke/todo-comments.nvim`
- `dnlhc/glance.nvim`

### Editing helpers

- `windwp/nvim-autopairs`
- `kylechui/nvim-surround`
- `monaqa/dial.nvim`
- `echasnovski/mini.indentscope`
- `lewis6991/hover.nvim`
- `madskjeldgaard/cppman.nvim`
- `Diogo-ss/42-header.nvim`
- `josstei/whisk.nvim`
- `danymat/neogen`
- `MeanderingProgrammer/render-markdown.nvim`

### Utility libraries and integrations

- `nvim-lua/plenary.nvim`
- `MunifTanjim/nui.nvim`
- `rktjmp/lush.nvim`
- `MrSloth-dev/Switcheroo.nvim`
- `vyfor/cord.nvim`
- `nvzone/typr`
- `nvzone/volt`
- `nvim-neo-tree/neo-tree.nvim`
- `kevinhwang91/promise-async`
- `cacarico/make.nvim`

### Treesitter

- `nvim-treesitter/nvim-treesitter`

### Optional/inactive plugin specs currently commented

- `giabari/pets.nvim`
- `sphamba/smear-cursor.nvim`

### Themes shipped in `lua/theme`

- `Yosskavo/shekai.nvim`
- `folke/tokyonight.nvim`
- `EdenEast/nightfox.nvim`
- `rebelot/kanagawa.nvim`
- `rose-pine/neovim`
- `sainnhe/gruvbox-material`
- `catppuccin/nvim`

## 11) 42 / C-family Helpers

- `core/norm.lua`: wraps `c_formatter_42`
- `core/lang/norm.lua`: wraps `norminette`
- `usr/test.lua`: floating 42 norm cheat-sheet popup
- `usr/man.lua`: floating `man` page popup
- keymaps include:
  - `<localleader>fn` format with 42 formatter
  - `<localleader>fh` insert 42 header

## 12) Notes and Caveats

- `updatetime=0` is very aggressive and may affect event frequency.
- Some plugin/config files are placeholders or currently commented in parts.
- `lua/plugins/init.lua` is intentionally minimal; plugin specs are discovered from `lua/plugins/*.lua` and `lua/theme/*.lua` imports in lazy setup.

## 13) File Map

- `init.lua`: entrypoint
- `lua/core/*`: core logic (options, lazy bootstrap, mappings, autocmds)
- `lua/core/key/*`: keymap groups
- `lua/core/cmd/*`: custom commands/autocmd modules
- `lua/config/*`: plugin setup functions
- `lua/plugins/*`: plugin specs
- `lua/theme/*`: theme specs
- `lua/usr/*`: user helpers/popups
