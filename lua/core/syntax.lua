-- Import the language modules
local c_cpp = require("core.lang.c_cpp")
local norm = require("core.lang.norm")
local python = require("core.lang.python")

-- UI Helper: Floating Quickfix Window (Keep this here as it's a shared UI tool)
local function make_qf_float(title_text)
    local qf_winid = vim.fn.getqflist({ winid = 0 }).winid
    if qf_winid > 0 then
        vim.cmd("cclose")
        return
    end

    vim.cmd("copen")
    local win = vim.api.nvim_get_current_win()
    local buf = vim.api.nvim_get_current_buf()

    -- Calculate dimensions
    local width = math.ceil(vim.o.columns * 0.8)
    local height = math.ceil(vim.o.lines * 0.6)
    local row = math.ceil((vim.o.lines - height) / 2) - 1
    local col = math.ceil((vim.o.columns - width) / 2)

    vim.api.nvim_win_set_config(win, {
        relative = "editor",
        row = row,
        col = col,
        width = width,
        height = height,
        border = "rounded",
        style = "minimal",
        title = title_text or " Errors ",
        title_pos = "center",
    })

    -- Focus the window
    vim.api.nvim_set_current_win(win)

    -- Styling
    vim.wo[win].winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder"

    -- Buffer-local Keymaps
    local opts = { buffer = buf, silent = true, nowait = true }

    -- Close window
    vim.keymap.set("n", "q", "<cmd>cclose<CR>", opts)
    vim.keymap.set("n", "<Esc>", "<cmd>cclose<CR>", opts)

    -- Jump to error under cursor and close float
    vim.keymap.set("n", "<CR>", "<CR><cmd>cclose<CR>zz", opts)

    -- NEW: Navigation with n and N (or p) inside the float
    -- This jumps to the next/prev error and keeps the cursor in the float
-- Capture the float window ID to return to it
    local float_win = vim.api.nvim_get_current_win()

    -- Navigation with n and N inside the float
    vim.keymap.set("n", "n", function()
        -- 1. Try to move to the next error
        local ok = pcall(vim.cmd, "cnext")
        if ok then
            -- 2. Center the screen in the code buffer
            vim.cmd("normal! zz")
            -- 3. Jump back to the floating window
            vim.api.nvim_set_current_win(float_win)
        else
            print("Reached end of error list")
        end
    end, opts)

    vim.keymap.set("n", "N", function()
        -- 1. Try to move to the previous error
        local ok = pcall(vim.cmd, "cprev")
        if ok then
            -- 2. Center the screen
            vim.cmd("normal! zz")
            -- 3. Jump back to the floating window
            vim.api.nvim_set_current_win(float_win)
        else
            print("Reached start of error list")
        end
    end, opts)

end
-- --- KEYMAPS ---

-- 1. Unified Check Keymap
-- --- UI Helper ---


local function check_and_run()
    local ext = vim.fn.expand("%:e")
    local file = vim.fn.expand("%")
    local cmd = {}
    local title = ""

    -- 1. Define Logic per Extension
    if ext == "c" then
        -- Syntax check with gcc/cc (compile only, no linking)
        cmd = { "gcc", "-fsyntax-only", "-Wall", "-Wextra", "-Werror", file }
        title = " C Syntax Check "
    elseif ext == "cpp" or ext == "cc" then
        cmd = { "g++", "-fsyntax-only", "-Wall", "-Wextra", "-Werror", file }
        title = " C++ Syntax Check "
    elseif ext == "py" then
        -- Using flake8 for python syntax/linting
        cmd = { "flake8", file }
        title = " Python Lint (flake8) "
    elseif ext == "lua" then
        -- luac is the standard way to check lua syntax without running
        cmd = { "luac", "-p", file }
        title = " Lua Syntax Check "
    else
        print("No runner configured for ." .. ext)
        return
    end

    -- 2. Execute Syntax Check
    vim.system(cmd, { text = true }, function(obj)
        vim.schedule(function()
            if obj.code == 0 then
                -- IF SYNTAX IS CLEAN -> RUN THE FILE
                vim.cmd("cclose")
                print("Syntax OK! Running...")
                -- Open a terminal to see the output
                if ext == "py" then
                    vim.cmd("split | term python3 " .. file)
                elseif ext == "lua" then
                    vim.cmd("split | term luajit " .. file) -- or 'lua'
                elseif ext == "c" then
                    -- Compile and Run for C
                    vim.cmd("split | term gcc " .. file .. " -o out && ./out && rm out")
                elseif ext == "cpp" then
                    -- Compile and Run for C++
                    vim.cmd("split | term g++ " .. file .. " -o out && ./out && rm out")
                end
            else
                -- IF SYNTAX FAILS -> SHOW ERRORS
                local lines = vim.split(obj.stdout .. obj.stderr, "\n")
                vim.fn.setqflist({}, 'r', { title = title, lines = lines })
                make_qf_float(title)
            end
        end)
    end)
end

-- --- Keymap ---
vim.keymap.set("n", "<localleader>sc", check_and_run, { desc = "Check syntax and Run" })
vim.keymap.set("n", "<localleader>e", function() make_qf_float(" Errors ") end, {desc = "error's buffer"})
