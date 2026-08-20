-- lua/core/cmd/valgrind.lua
-- Memory leak checker for 42 C/C++ projects using Valgrind

local function run_valgrind(custom_args)
    if vim.fn.executable("valgrind") == 0 then
        vim.notify("Valgrind is not installed on this system.", vim.log.levels.ERROR, { title = "Valgrind" })
        return
    end

    local file = vim.fn.expand("%")
    local ext = vim.fn.expand("%:e")
    local cwd = vim.fn.getcwd()

    -- Look for executable candidates: explicit argument, ./out, ./a.out, or Makefile project name
    local target = custom_args and custom_args ~= "" and custom_args or nil

    if not target then
        if vim.fn.filereadable(cwd .. "/out") == 1 then
            target = "./out"
        elseif vim.fn.filereadable(cwd .. "/a.out") == 1 then
            target = "./a.out"
        else
            -- Check for executables in current directory
            local files = vim.fn.globpath(cwd, "*", false, true)
            for _, f in ipairs(files) do
                if vim.fn.executable(f) == 1 and vim.fn.isdirectory(f) == 0 and not f:match("%.sh$") and not f:match("%.py$") then
                    target = "./" .. vim.fn.fnamemodify(f, ":t")
                    break
                end
            end
        end
    end

    if not target and (ext == "c" or ext == "cpp" or ext == "cc") then
        local compiler = (ext == "c") and "gcc -Wall -Wextra -Werror" or "g++ -Wall -Wextra -Werror"
        local cmd_str = string.format("%s -g %s -o out && valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./out", compiler, file)
        vim.cmd("split | term " .. cmd_str)
        return
    end

    if not target then
        vim.notify("No executable found to run Valgrind on. Compile first with 'make' or pass binary name (:Valgrind ./binary)", vim.log.levels.WARN, { title = "Valgrind" })
        return
    end

    local valgrind_cmd = string.format("valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes %s", target)
    vim.cmd("split | term " .. valgrind_cmd)
end

vim.api.nvim_create_user_command("Valgrind", function(opts)
    run_valgrind(opts.args)
end, { nargs = "?", desc = "Run Valgrind full leak-check on current target/binary" })

vim.api.nvim_create_user_command("Leaks", function(opts)
    run_valgrind(opts.args)
end, { nargs = "?", desc = "Alias for :Valgrind" })
