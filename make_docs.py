import glob
import re

doc = "# Inverted-Nvim Full Documentation\n\n"
doc += "This document details every plugin, its configuration, core features, and keybindings used in this Neovim setup.\n\n"

doc += "## 1. Core Architecture\n\n"
doc += "The `lua/core/` directory contains the foundational settings and commands of the editor.\n\n"
core_files = sorted(glob.glob('/home/runner/work/nvim/nvim/lua/core/*.lua'))
for f in core_files:
    name = f.split('/')[-1]
    doc += f"### `{name}`\n"
    with open(f, 'r') as file:
        content = file.read()
        if "option" in name:
            doc += "Configures general Neovim options such as `shiftwidth=4`, `number=true`, `relativenumber=true`, `clipboard=unnamedplus`, etc.\n"
        elif "lazy" in name:
            doc += "Bootstraps `lazy.nvim`, the plugin manager, and configures the default layout for the plugin manager UI.\n"
        elif "autocmd" in name:
            doc += "Sets up autocommands to run on specific Neovim events (e.g., highlighting on yank, reloading on file change).\n"
        elif "keymaps" in name:
            doc += "Main entry point for all keymap configurations inside `lua/core/key/`.\n"
        elif "syntax" in name:
            doc += "Provides syntax checking and code-runner execution tailored for C, C++, Python, and Lua (used with `<localleader>sc`). Includes floating Quickfix window UI.\n"
        else:
            doc += "Core functionality component.\n"
    doc += "\n"

doc += "## 2. Keybindings (`lua/core/key/`)\n\n"
doc += "Keymaps are modularized by their use-case.\n\n"

key_files = sorted(glob.glob('/home/runner/work/nvim/nvim/lua/core/key/*.lua'))
for f in key_files:
    name = f.split('/')[-1]
    doc += f"### `{name}`\n"
    with open(f, 'r') as file:
        content = file.read()
        maps = re.findall(r'vim\.keymap\.set\([^,]+,\s*"([^"]+)"', content)
        if maps:
            doc += "- **Keys mapped**: `" + "`, `".join(maps) + "`\n"
        else:
            doc += "Contains dynamic or specific functionality keymaps.\n"
    doc += "\n"

doc += "## 3. Plugins & Configuration (`lua/plugins/`)\n\n"
doc += "Plugins are loaded via `lazy.nvim`. Each plugin file specifies the repository, loading events, and specific configurations.\n\n"

plugins = sorted(glob.glob('/home/runner/work/nvim/nvim/lua/plugins/*.lua'))
for f in plugins:
    name = f.split('/')[-1]
    with open(f, 'r') as file:
        content = file.read()
        match = re.search(r'["\']([^/]+/[^"\']+)["\']', content)
        repo = match.group(1) if match else name.replace('.lua', '')
        
        doc += f"### `{name}` ({repo})\n"
        
        # Describe based on known plugins
        if 'cmp' in name:
            desc = "Autocompletion engine. Configured to use LSP, snippets, and buffer sources. It features a hard-mode that prevents using arrows to enforce `C-n`/`C-p`."
        elif 'telescope' in name:
            desc = "Fuzzy finder for files, live grep, buffers, and more. Highly extensible."
        elif 'oil' in name:
            desc = "File explorer that lets you edit your filesystem like a normal Neovim buffer."
        elif 'treesitter' in name:
            desc = "Advanced syntax highlighting, indentation, and code navigation parsing."
        elif 'lsp' in name:
            desc = "Language Server Protocol integration for autocompletion, diagnostics, go-to-definition, etc."
        elif 'mason' in name:
            desc = "Portable package manager for installing LSP servers, DAP servers, linters, and formatters."
        elif 'lazygit' in name:
            desc = "Integration for the LazyGit terminal UI."
        elif 'which-key' in name:
            desc = "Displays a popup with possible key bindings of the command you started typing."
        elif 'lualine' in name:
            desc = "Fast and easy to configure statusline."
        elif 'trouble' in name:
            desc = "A pretty diagnostics, references, telescope results, quickfix and location list to help you solve all the trouble your code is causing."
        elif '42header' in name:
            desc = "Provides formatting and rules specific to 42 School standard headers."
        elif 'dashboard' in name:
            desc = "Startup screen for Neovim."
        elif 'bufferline' in name:
            desc = "A snazzy bufferline (with tabpage integration)."
        elif 'fzf-lua' in name:
            desc = "Improved fzf integration for blazing fast search."
        else:
            desc = "Enhances standard Neovim capabilities."
            
        doc += f"- **What it does:** {desc}\n"
        
        opts_keys = []
        if 'keys =' in content:
            opts_keys.append("custom keys")
        if 'opts =' in content or 'config =' in content:
            opts_keys.append("custom config")
            
        if opts_keys:
            doc += f"- **Config/Keys:** Includes {', '.join(opts_keys)}.\n"
            
    doc += "\n"

with open('/home/runner/work/nvim/nvim/docs/FULL_DOCUMENTATION.md', 'w') as out:
    out.write(doc)

