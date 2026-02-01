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

    -- 1. Calculate the center of your screen
    local width = math.ceil(vim.o.columns * 0.8)
    local height = math.ceil(vim.o.lines * 0.6)
    local row = math.ceil((vim.o.lines - height) / 2) - 1
    local col = math.ceil((vim.o.columns - width) / 2)

    -- 2. Apply the config to move it to the middle
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

    -- 3. Styling and Keymaps
    vim.wo[win].winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder"

    local opts = { buffer = buf, silent = true }
    vim.keymap.set("n", "<CR>", "<CR><cmd>cclose<CR>zz", opts)
    vim.keymap.set("n", "q", "<cmd>cclose<CR>", opts)
    vim.keymap.set("n", "<Esc>", "<cmd>cclose<CR>", opts)
    vim.keymap.set("n", "<C-_>", "<cmd>cclose<CR>", opts)
end
-- --- KEYMAPS ---

-- 1. Unified Check Keymap
vim.keymap.set("n", "<localleader>c", function()
    local ext = vim.fn.expand("%:e")
    local output, title

    if ext == "c" or ext == "cpp" or ext == "cc" then
        output, title = c_cpp.check_syntax()
    elseif ext == "py" then
        output, title = python.check_syntax()
    else
        print("No checker for ." .. ext)
        return
    end

    vim.fn.setqflist({}, 'r', { title = title, lines = output })
    if #output > 0 then make_qf_float(title) else vim.cmd("cclose") print("Clean!") end
end, {desc = "check c/cpp syntax"})

-- 2. Python Specific Execution
vim.keymap.set("n", "<localleader>f", function()
    -- Get the file and title from your norm.lua module
    local file = vim.fn.expand("%")
    local _, title = norm.check_norm()

    -- Run norminette and check the exit status
    vim.system({ "norminette", file }, { text = true }, function(obj)
        vim.schedule(function()
            -- Exit code 0 means the Norm is perfect
            if obj.code == 0 then
                vim.cmd("cclose")
                print("Norm done!")
            else
                -- If status is not 0, grab the error output
                local lines = vim.split(obj.stdout .. obj.stderr, "\n")
                vim.fn.setqflist({}, 'r', { title = title, lines = lines })
                make_qf_float(title)
            end
        end)
    end)
end, { desc = "Check 42 Norm" })


-- 3. Universal Toggles
vim.keymap.set("n", "<localleader>e", function() make_qf_float(" Errors ") end, {desc = "error's buffer"})
vim.keymap.set("n", "<localleader>n", "<cmd>cnext<CR>zz", {desc = "next error"})
vim.keymap.set("n", "<localleader>p", "<cmd>cprev<CR>zz", {desc = "previous error"})
