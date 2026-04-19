-- lua/shekai/commands.lua (or init.lua)

vim.api.nvim_create_user_command("Clone", function()
    vim.ui.input({ prompt = "  GitHub Username: " }, function(owner)
        if not owner or owner == "" then return end

        vim.ui.input({ prompt = "  Repo Name: " }, function(repo)
            if not repo or repo == "" then return end

            -- 🛑 NEW: Ask for the protocol using a selection menu
            vim.ui.select({ "SSH", "HTTPS" }, {
                prompt = "󰒃 Protocol (Default: SSH): "
            }, function(choice)
                
                -- If they hit Escape or don't choose, default to SSH
                local protocol = choice or "SSH"

                vim.ui.input({ prompt = "  Clone Path (Press Enter for Desktop): " }, function(path)
                    if not path then return end 

                    if path == "" then
                        path = "~/Desktop"
                    end

                    -- Build the correct URL based on the protocol choice
                    local url = ""
                    if protocol == "HTTPS" then
                        url = "https://github.com/" .. owner .. "/" .. repo .. ".git"
                    else
                        -- SSH Format
                        url = "git@github.com:" .. owner .. "/" .. repo .. ".git"
                    end

                    local clean_path = vim.fn.expand(path):gsub("/$", "")
                    local final_dest = clean_path .. "/" .. repo

                    vim.notify("󱑒 Cloning " .. repo .. " via " .. protocol .. "...", vim.log.levels.INFO, { title = "Git Clone" })

                    vim.fn.jobstart({"git", "clone", url, final_dest}, {
                        on_exit = function(_, exit_code)
                            if exit_code == 0 then
                                vim.notify(" Successfully cloned '" .. repo .. "' to " .. path, vim.log.levels.INFO, { title = "Git Clone" })
                            else
                                vim.notify("  Failed to clone '" .. repo .. "'. (Check SSH keys or folder path)", vim.log.levels.ERROR, { title = "Git Clone Error" })
                            end
                        end
                    })
                end)
            end)
        end)
    end)
end, { desc = "Interactive Async Git Clone" })

