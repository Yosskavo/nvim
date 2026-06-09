-- lua/shekai/autocmds/repo_checker.lua

local function check_current_repo_updates()
    -- Get the current directory Neovim is opened in
    local cwd = vim.fn.getcwd()

    -- Step 1: Check if this folder is actually a Git repository
    vim.system({ 'git', 'rev-parse', '--is-inside-work-tree' }, { cwd = cwd }, function(repo_out)
        if repo_out.code ~= 0 then return end -- Silently exit if it's just a normal folder

        -- Step 2: Fetch the latest info from the remote (GitHub/GitLab)
        vim.system({ 'git', 'fetch' }, { cwd = cwd }, function(fetch_out)
            if fetch_out.code ~= 0 then return end -- Silently exit if offline or no remote exists

            -- Step 3: Check if our local branch is behind the remote branch
            vim.system({ 'git', 'rev-list', 'HEAD..@{u}', '--count' }, { cwd = cwd }, function(rev_out)
                if rev_out.code == 0 then
                    local count = tonumber(vim.trim(rev_out.stdout))
                    
                    if count and count > 0 then
                        -- Step 4: Warn the user!
                        vim.schedule(function()
                            vim.notify(
                                string.format("󱙽 WARNING: This repo is %d commit(s) behind origin!\nCheck <leader>g before making changes to avoid conflicts.", count),
                                vim.log.levels.WARN,
                                { title = "Git Repo Checker", timeout = 8000 }
                            )
                        end)
                    end
                end
            end)
        end)
    end)
end

-- ==========================================
-- THE AUTOCOMMAND HOOKS
-- ==========================================
-- We listen to TWO events here to make it bulletproof:
-- 1. VimEnter: When you first open Neovim in the terminal.
-- 2. DirChanged: If you change directories from inside Neovim (like using a session manager or `:cd`)
vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
    pattern = "*",
    callback = function()
        -- Wait 2 seconds before checking so we don't slow down your Neovim startup speed
        vim.defer_fn(check_current_repo_updates, 2000)
    end,
})
