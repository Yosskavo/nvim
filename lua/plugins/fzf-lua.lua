return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
        return {
            -- Keep the Telescope layout for your custom highlights
            profile = "telescope", 
            
            keymap = {
                builtin = {
                    -- These apply to the Neovim UI components (like the preview window)
                    ["<Esc>"] = "hide", 
                    ["q"]     = "hide", 
                },
                fzf = {
                    -- These apply directly to the fzf prompt while you are typing (Insert mode)
                    -- "abort" kills the fzf process instantly
                    ["esc"] = "abort",
                },
            },
            winopts = {
                -- This is the bulletproof hook. It runs the exact millisecond the fzf window opens.
                -- It guarantees that if you drop into Neovim normal mode inside the fzf window, 
                -- 'q' and 'Esc' will instantly close it without trapping you.
                on_create = function()
                    local bufnr = vim.api.nvim_get_current_buf()
                    
                    -- Map 'q' to close in normal mode
                    vim.keymap.set("n", "q", "<cmd>close<CR>", { 
                        buffer = bufnr, silent = true, nowait = true 
                    })
                    
                    -- Map 'Esc' to close in normal mode
                    vim.keymap.set("n", "<Esc>", "<cmd>close<CR>", { 
                        buffer = bufnr, silent = true, nowait = true 
                    })
                end,
            }
        }
    end
}
