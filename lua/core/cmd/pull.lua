-- lua/shekai/autocmds/updater.lua
local config_dir = vim.fn.stdpath("config")

-- ==========================================
-- 1. THE CUSTOM UPDATE COMMAND
-- ==========================================
vim.api.nvim_create_user_command("InvertedUpdate", function()
    vim.notify(" Pulling latest config...", vim.log.levels.INFO, { title = "Updater" })
    
    -- Run 'git pull' asynchronously in your config directory
    vim.system({ 'git', 'pull' }, { cwd = config_dir }, function(out)
        -- We must use vim.schedule to safely interact with the Neovim UI from a background job
        vim.schedule(function()
            if out.code == 0 then
                vim.notify("󱞀 Config pulled successfully! Updating plugins...", vim.log.levels.INFO, { title = "Updater" })
                -- Trigger Lazy to update plugins right after git pull finishes
                vim.cmd("Lazy update")
            else
                vim.notify("󱙐 Git pull failed. Are there merge conflicts?\n" .. (out.stderr or ""), vim.log.levels.ERROR, { title = "Updater" })
            end
        end)
    end)
end, { desc = "Pull latest git config and update plugins" })


-- ==========================================
-- 2. THE BACKGROUND CHECKER
-- ==========================================
local function check_for_updates()
    -- Step A: Fetch the latest changes from origin silently
    vim.system({ 'git', 'fetch' }, { cwd = config_dir }, function(fetch_out)
        if fetch_out.code ~= 0 then return end -- Silently fail if offline or not a git repo

        -- Step B: Check how many commits we are behind the remote branch
        -- '@{u}' is a Git shortcut for 'the upstream branch we are tracking'
        vim.system({ 'git', 'rev-list', 'HEAD..@{u}', '--count' }, { cwd = config_dir }, function(rev_out)
            if rev_out.code == 0 then
                local count = tonumber(vim.trim(rev_out.stdout))
                
                if count and count > 0 then
                    -- Step C: Notify the user if updates exist
                    vim.schedule(function()
                        vim.notify(
                            string.format("󱝾 Config has %d new update(s)!\nRun :InvertedUpdate to apply.", count), 
                            vim.log.levels.WARN, 
                            { title = "Config Auto-Updater", timeout = 5000 }
                        )
                    end)
                end
            end
        end)
    end)
end


-- ==========================================
-- 3. THE AUTOCOMMAND HOOK
-- ==========================================
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
	once = true,
    callback = function()
        -- Wait 2 seconds after Neovim opens before checking.
        -- This guarantees the update check won't slow down your startup time!
        vim.defer_fn(check_for_updates, 0)
    end,
})
