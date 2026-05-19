-- lua/shekai/autocmds/reminder.lua
local config_dir = vim.fn.stdpath("config")

local function check_unpushed_config()
    -- Step 1: Check for uncommitted (dirty) files
    vim.system({ 'git', 'status', '--porcelain' }, { cwd = config_dir }, function(status_out)
        if status_out.code ~= 0 then return end -- Fails silently if not a git repo
        
        local is_dirty = status_out.stdout and status_out.stdout ~= ""

        -- Step 2: Check for unpushed commits (Local is ahead of Origin)
        -- 'HEAD..@{u}' checks pull, but '@{u}..HEAD' checks PUSH!
        vim.system({ 'git', 'rev-list', '@{u}..HEAD', '--count' }, { cwd = config_dir }, function(rev_out)
            local unpushed_count = tonumber(vim.trim(rev_out.stdout)) or 0
            
            -- Step 3: Build the warning message based on what it found
            if is_dirty or unpushed_count > 0 then
                vim.schedule(function()
                    local msg = "  Config Backup Reminder:\n"
                    
                    if is_dirty then
                        msg = msg .. "- You have uncommitted changes.\n"
                    end
                    
                    if unpushed_count > 0 then
                        msg = msg .. string.format("- You have %d unpushed commit(s).\n", unpushed_count)
                    end
                    
                    msg = msg .. "\nDon't forget to push to GitHub!"
                    
                    -- Use log level WARN so it pops out visually
                    vim.notify(msg, vim.log.levels.WARN, { title = "Git Guardian", timeout = 6000 })
                end)
            end
        end)
    end)
end

-- ==========================================
-- THE AUTOCOMMAND HOOK
-- ==========================================
vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
	once = true,
    callback = function()
        -- Wait 4 seconds after opening Neovim. 
        -- This ensures it doesn't overlap with the 2-second Pull checker!
        vim.defer_fn(check_unpushed_config, 0)
    end,
})
