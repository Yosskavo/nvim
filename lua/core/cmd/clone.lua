-- Add this helper function outside the command to keep things clean
local function perform_clone(provider, owner, repo, proto, dest_path)
    local base = (proto == "HTTPS") and provider.https or provider.ssh
    local url = base .. owner .. "/" .. repo .. ".git"
    local final_dest = vim.fn.expand(dest_path) .. "/" .. repo

    -- Check if it exists
    if vim.fn.isdirectory(final_dest) == 1 then
        vim.ui.input({ prompt = "  Folder '" .. repo .. "' exists. New name: " }, function(new_name)
            if not new_name or new_name == "" then
                vim.notify("Clone aborted.", vim.log.levels.WARN)
                return
            end
            -- Recursively call this function with the new name
            perform_clone(provider, owner, new_name, proto, dest_path)
        end)
        return
    end

    -- If no collision, proceed to clone
    vim.notify("󱑒 Cloning " .. repo .. "...", vim.log.levels.INFO, { title = "Git Clone" })
    vim.fn.jobstart({"git", "clone", url, final_dest}, {
        on_exit = function(_, exit_code)
            if exit_code == 0 then
                vim.notify(" Cloned to: " .. final_dest, vim.log.levels.INFO, { title = "Success" })
            else
                vim.notify(" Failed (Check URL/Permissions)", vim.log.levels.ERROR, { title = "Git Clone Error" })
            end
        end
    })
end

-- The main command
vim.api.nvim_create_user_command("Clone", function()
    local providers = {
        { name = "GitHub",   ssh = "git@github.com:",   https = "https://github.com/" },
        { name = "GitLab",   ssh = "git@gitlab.com:",   https = "https://gitlab.com/" },
        { name = "Codeberg", ssh = "git@codeberg.org:", https = "https://codeberg.org/" },
    }

    vim.ui.select(providers, { prompt = "󰒃 Choose Source: ", format_item = function(item) return item.name end }, function(provider)
        if not provider then return end
        vim.ui.input({ prompt = "  " .. provider.name .. " Username: " }, function(owner)
            if not owner or owner == "" then return end
            vim.ui.input({ prompt = "  Repo Name: " }, function(repo)
                if not repo or repo == "" then return end
                vim.ui.select({ "SSH", "HTTPS" }, { prompt = "󰒃 Protocol: " }, function(protocol)
                    local proto = protocol or "SSH"
                    vim.ui.input({ prompt = "  Path (Enter for ~/Desktop): " }, function(path)
                        local target_path = (path == "" or not path) and "~/Desktop" or path
                        perform_clone(provider, owner, repo, proto, target_path)
                    end)
                end)
            end)
        end)
    end)
end, { desc = "Interactive Async Git Clone" })
