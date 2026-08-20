-- Hover in insert and visual modes
vim.keymap.set("i", "<A-S-k>", function() vim.lsp.buf.hover() end, { desc = "hover lsp", silent = true })
vim.keymap.set("v", "<S-k>", function() vim.lsp.buf.hover() end, { desc = "hover lsp", silent = true })

-- Code Actions
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })

-- Toggle Inlay Hints (Neovim 0.10+)
vim.keymap.set("n", "<leader>ti", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    local status = vim.lsp.inlay_hint.is_enabled() and "Enabled" or "Disabled"
    vim.notify("LSP Inlay Hints: " .. status, vim.log.levels.INFO, { title = "LSP" })
end, { desc = "Toggle Inlay Hints" })

-- Valgrind Memory Leak Checker
vim.keymap.set("n", "<leader>lv", "<cmd>Valgrind<CR>", { desc = "Run Valgrind Leak Check" })

-- Fast Header / Source Switcher (.c <-> .h, .cpp <-> .hpp)
local function switch_source_header()
    local clients = vim.lsp.get_clients({ bufnr = 0, name = "clangd" })
    if #clients > 0 then
        vim.cmd("ClangdSwitchSourceHeader")
    else
        local ext = vim.fn.expand("%:e")
        local root = vim.fn.expand("%:r")
        local counterparts = {
            c = { "h" },
            h = { "c", "cpp" },
            cpp = { "hpp", "h" },
            hpp = { "cpp", "c" },
            cc = { "hh", "h", "hpp" },
        }
        if counterparts[ext] then
            for _, target_ext in ipairs(counterparts[ext]) do
                local target = root .. "." .. target_ext
                if vim.fn.filereadable(target) == 1 then
                    vim.cmd("edit " .. target)
                    return
                end
            end
        end
        vim.notify("No counterpart header/source file found", vim.log.levels.WARN, { title = "LSP" })
    end
end

vim.keymap.set("n", "<A-o>", switch_source_header, { desc = "Switch Header/Source (.c <-> .h)" })
vim.keymap.set("n", "<leader>cs", switch_source_header, { desc = "Switch Header/Source (.c <-> .h)" })
