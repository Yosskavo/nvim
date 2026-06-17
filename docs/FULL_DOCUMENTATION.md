# Inverted-Nvim Full Documentation

This document details every plugin, its configuration, core features, and keybindings used in this Neovim setup.

## 1. Core Architecture

The `lua/core/` directory contains the foundational settings and commands of the editor.

### `autocmd.lua`
Sets up autocommands to run on specific Neovim events (e.g., highlighting on yank, reloading on file change).

### `keymaps.lua`
Main entry point for all keymap configurations inside `lua/core/key/`.

### `lazy.lua`
Bootstraps `lazy.nvim`, the plugin manager, and configures the default layout for the plugin manager UI.

### `norm.lua`
Core functionality component.

### `option.lua`
Configures general Neovim options such as `shiftwidth=4`, `number=true`, `relativenumber=true`, `clipboard=unnamedplus`, etc.

### `syntax.lua`
Provides syntax checking and code-runner execution tailored for C, C++, Python, and Lua (used with `<localleader>sc`). Includes floating Quickfix window UI.

## 2. Keybindings (`lua/core/key/`)

Keymaps are modularized by their use-case.

### `arrows.lua`
Contains dynamic or specific functionality keymaps.

### `bufferline.lua`
Contains dynamic or specific functionality keymaps.

### `dashboard.lua`
- **Keys mapped**: `<localleader>d`

### `glance.lua`
Contains dynamic or specific functionality keymaps.

### `hover.lua`
- **Keys mapped**: `K`, `<A-K>`, `K`

### `lazygit.lua`
- **Keys mapped**: `<leader>lg`

### `lsp.lua`
- **Keys mapped**: `<A-S-k>`, `<S-k>`

### `norm.lua`
- **Keys mapped**: `<localleader>fn`, `<localleader>fh`

### `notify.lua`
- **Keys mapped**: `<leader>wn`, `<leader>nc`

### `nui.lua`
- **Keys mapped**: `<localleader>m`, `<leader>hn`

### `oil.lua`
- **Keys mapped**: `-`

### `opts.lua`
- **Keys mapped**: `<Esc>`

### `switcheroo.lua`
- **Keys mapped**: `<A-t>`

### `syntax.lua`
- **Keys mapped**: `<Tab>`, `<S-Tab>`

### `telescope.lua`
Contains dynamic or specific functionality keymaps.

### `term.lua`
Contains dynamic or specific functionality keymaps.

### `text.lua`
- **Keys mapped**: `<S-A-j>`, `<S-A-k>`, `<S-A-j>`, `<S-A-k>`, `<S-A-j>`, `<S-A-k>`, `<S-A-p>`

### `todo.lua`
- **Keys mapped**: `<leader>ft`

### `trouble.lua`
- **Keys mapped**: `<leader>xx`, `<leader>xX`, `<leader>xs`, `<leader>xl`, `<leader>xL`, `<leader>xQ`

### `typr.lua`
- **Keys mapped**: `<localleader>tt`, `<localleader>ts`

### `wind.lua`
- **Keys mapped**: `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`, `<leader>sh`, `<leader>sv`

### `yazi.lua`
- **Keys mapped**: `<A-y>`

## 3. Plugins & Configuration (`lua/plugins/`)

Plugins are loaded via `lazy.nvim`. Each plugin file specifies the repository, loading events, and specific configurations.

### `42header.lua` (Diogo-ss/42-header.nvim)
- **What it does:** Provides formatting and rules specific to 42 School standard headers.
- **Config/Keys:** Includes custom keys, custom config.

### `autopairs.lua` (windwp/nvim-autopairs)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `bufferline.lua` (akinsho/bufferline.nvim)
- **What it does:** A snazzy bufferline (with tabpage integration).
- **Config/Keys:** Includes custom config.

### `cheatsheet.lua` (sudormrfbin/cheatsheet.nvim)
- **What it does:** Enhances standard Neovim capabilities.

### `colorizer.lua` (catgoose/nvim-colorizer.lua)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `cord.lua` (vyfor/cord.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `cppman.lua` (madskjeldgaard/cppman.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `dashboard.lua` (nvimdev/dashboard-nvim)
- **What it does:** Startup screen for Neovim.
- **Config/Keys:** Includes custom config.

### `dial.lua` (monaqa/dial.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom keys, custom config.

### `dressing.lua` (stevearc/dressing.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `flash.lua` (folke/flash.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom keys, custom config.

### `fzf-lua.lua` (ibhagwan/fzf-lua)
- **What it does:** Improved fzf integration for blazing fast search.
- **Config/Keys:** Includes custom config.

### `gitsigns.lua` (lewis6991/gitsigns.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `glance.lua` (dnlhc/glance.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `grug-far.lua` (MagicDuck/grug-far.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `hover.lua` (lewis6991/hover.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `init.lua` (init)
- **What it does:** Enhances standard Neovim capabilities.

### `lazydev.lua` (folke/lazydev.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `lazygit.lua` (kdheepak/lazygit.nvim)
- **What it does:** Integration for the LazyGit terminal UI.

### `lsp_signature.lua` (ray-x/lsp_signature.nvim)
- **What it does:** Language Server Protocol integration for autocompletion, diagnostics, go-to-definition, etc.
- **Config/Keys:** Includes custom config.

### `lspconfig.lua` (neovim/nvim-lspconfig)
- **What it does:** Language Server Protocol integration for autocompletion, diagnostics, go-to-definition, etc.
- **Config/Keys:** Includes custom config.

### `lualine.lua` (nvim-lualine/lualine.nvim)
- **What it does:** Fast and easy to configure statusline.
- **Config/Keys:** Includes custom config.

### `lush.lua` (rktjmp/lush.nvim)
- **What it does:** Enhances standard Neovim capabilities.

### `make.lua` (cacarico/make.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `markdown.lua` (MeanderingProgrammer/render-markdown.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `mason-lspconfig.lua` (williamboman/mason-lspconfig.nvim)
- **What it does:** Language Server Protocol integration for autocompletion, diagnostics, go-to-definition, etc.
- **Config/Keys:** Includes custom config.

### `mason.lua` (mason-org/mason.nvim)
- **What it does:** Portable package manager for installing LSP servers, DAP servers, linters, and formatters.
- **Config/Keys:** Includes custom config.

### `mini_indentscope.lua` (echasnovski/mini.indentscope)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `neo-tree.lua` (nvim-neo-tree/neo-tree.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom keys, custom config.

### `neogen.lua` (danymat/neogen)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom keys, custom config.

### `noice.lua` (folke/noice.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `notify.lua` (rcarriga/nvim-notify)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `nui.lua` (MunifTanjim/nui.nvim)
- **What it does:** Enhances standard Neovim capabilities.

### `nvim-cmp.lua` (hrsh7th/nvim-cmp)
- **What it does:** Autocompletion engine. Configured to use LSP, snippets, and buffer sources. It features a hard-mode that prevents using arrows to enforce `C-n`/`C-p`.
- **Config/Keys:** Includes custom config.

### `oil.lua` (stevearc/oil.nvim)
- **What it does:** File explorer that lets you edit your filesystem like a normal Neovim buffer.
- **Config/Keys:** Includes custom config.

### `pets.lua` (giabari/pets.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `plenary.lua` (nvim-lua/plenary.nvim)
- **What it does:** Enhances standard Neovim capabilities.

### `pomo.lua` (bxrne/pomo.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom keys, custom config.

### `project.lua` (ahmedkhalf/project.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `promise-async.lua` (kevinhwang91/promise-async)
- **What it does:** Enhances standard Neovim capabilities.

### `screenkey.lua` (NStefan002/screenkey.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `smear-cursor.lua` (sphamba/smear-cursor.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `spotify.lua` (yosskavo/spotify.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `surround.lua` (kylechui/nvim-surround)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `switcheroo.lua` (MrSloth-dev/Switcheroo.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `telescope-fzf.lua` (nvim-telescope/telescope-fzf-native.nvim)
- **What it does:** Fuzzy finder for files, live grep, buffers, and more. Highly extensible.
- **Config/Keys:** Includes custom config.

### `telescope.lua` (nvim-telescope/telescope.nvim)
- **What it does:** Fuzzy finder for files, live grep, buffers, and more. Highly extensible.
- **Config/Keys:** Includes custom config.

### `todo-comments.lua` (folke/todo-comments.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `toggleterm.lua` (akinsho/toggleterm.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `transparent.lua` (xiyaowong/transparent.nvim)
- **What it does:** Enhances standard Neovim capabilities.

### `treesitter-context.lua` (nvim-treesitter/nvim-treesitter-context)
- **What it does:** Advanced syntax highlighting, indentation, and code navigation parsing.
- **Config/Keys:** Includes custom config.

### `treesitter.lua` (nvim-treesitter/nvim-treesitter)
- **What it does:** Advanced syntax highlighting, indentation, and code navigation parsing.
- **Config/Keys:** Includes custom config.

### `trouble.lua` (folke/trouble.nvim)
- **What it does:** A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing.
- **Config/Keys:** Includes custom config.

### `typr.lua` (nvzone/typr)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `ufo.lua` (kevinhwang91/nvim-ufo)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `web-devicons.lua` (nvim-tree/nvim-web-devicons)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `which-key.lua` (folke/which-key.nvim)
- **What it does:** Displays a popup with possible key bindings of the command you started typing.
- **Config/Keys:** Includes custom config.

### `whisk.lua` (josstei/whisk.nvim)
- **What it does:** Enhances standard Neovim capabilities.
- **Config/Keys:** Includes custom config.

### `yazi.lua` (mikavilpas/yazi.nvim)
- **What it does:** Enhances standard Neovim capabilities.

