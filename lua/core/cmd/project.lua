-- lua/shekai/commands.lua

-- ============================================================================
-- 1. CORE HELPER FUNCTIONS (Pure Logic)
-- ============================================================================
local function write_file(filepath, content)
    local f = io.open(filepath, "w")
    if f then
        f:write(content)
        f:close()
    end
end

local function get_makefile_content(name, lang)
    if lang == "python" then
        return string.format([[
# --- MAKEFILE COLORS ---
C_GREEN = \033[0;32m
C_BLUE  = \033[0;34m
C_RED   = \033[0;31m
C_PURPLE = \033[1;35m
C_RESET = \033[0m

NAME = %s
PYTHON = python3
SRC = $(wildcard *.py)

all: run

run:
	@echo "$(C_BLUE)  Running $(NAME)...$(C_RESET)"
	@$(PYTHON) $(word 1, $(SRC))
	@echo "$(C_GREEN) 󰙴 Execution complete.$(C_RESET)"

clean:
	@echo "$(C_RED) 󰮘 Removing Python cache files...$(C_RESET)"
	@rm -rfv __pycache__
	@find . -type f -name '*.pyc' -exec rm -v {} + 2>/dev/null || true

fclean: clean

re: fclean all

.PHONY: all run clean fclean re
]], name)
    else
        local cc = (lang == "c++") and "c++" or "cc"
        local ext = (lang == "c++") and "cpp" or "c"
        local flags = (lang == "c++") and "-Wall -Wextra -Werror -std=c++98" or "-Wall -Wextra -Werror"
        
        return string.format([[
# --- MAKEFILE COLORS ---
C_GREEN  = \033[0;32m
C_YELLOW = \033[0;33m
C_BLUE   = \033[0;34m
C_RED    = \033[0;31m
C_RESET  = \033[0m
C_PURPLE = \033[1;35m

NAME = %s
CC = %s
CFLAGS = %s
SRC = $(wildcard *.%s)
OBJ = $(SRC:.%s=.o)

all: $(NAME)

$(NAME): $(OBJ)
	@echo "$(C_BLUE) 󰌷 Linking $(NAME)...$(C_RESET)"
	@$(CC) $(CFLAGS) $(OBJ) -o $(NAME)
	@echo "$(C_GREEN) 󰙴 Done compiling!$(C_RESET)"

%%.o: %%.%s
	@echo "$(C_YELLOW) 󰔚 Compiling $<...$(C_RESET)"
	@$(CC) $(CFLAGS) -c $< -o $@

clean:
	@echo "$(C_RED) 󰮘 Removing object files...$(C_RESET)"
	@rm -fv $(OBJ)

fclean: clean
	@echo "$(C_RED)  Removing executable $(NAME)...$(C_RESET)"
	@rm -fv $(NAME)

run: re all
	@echo "$(C_PURPLE)  Launching executable $(NAME)...$(C_RESET)"
	@./$(NAME)

re: fclean all
.PHONY: all clean fclean re run
]], name, cc, flags, ext, ext, ext)
    end
end

-- ============================================================================
-- 2. STANDALONE COMMANDS (Updated with Path Selection)
-- ============================================================================

vim.api.nvim_create_user_command("GenMake", function()
    -- 1. Ask for the Path
    vim.ui.input({ 
        prompt = " Directory to generate Makefile in: ", 
        default = vim.fn.getcwd(),
        completion = "dir" -- Enables folder autocomplete
    }, function(target_path)
        if not target_path or target_path == "" then return end

        -- Normalize path (expand ~ or relative paths)
        target_path = vim.fn.fnamemodify(target_path, ":p"):gsub("/$", "")

        -- 2. Ask for Project Name
        local default_name = vim.fn.fnamemodify(target_path, ":t")
        vim.ui.input({ prompt = "󱧊 Project Name: ", default = default_name }, function(name)
            if not name or name == "" then return end

            -- 3. Select Language
            vim.ui.select({ "c++", "c", "python" }, { prompt = "  Select Language:" }, function(lang)
                if not lang then return end

                -- Ensure directory exists
                if vim.fn.isdirectory(target_path) == 0 then
                    vim.fn.mkdir(target_path, "p")
                end

                local full_file_path = target_path .. "/Makefile"
                write_file(full_file_path, get_makefile_content(name, lang))
                
                vim.notify(" Makefile generated at " .. target_path, vim.log.levels.INFO, { title = "GenMake" })
            end)
        end)
    end)
end, { desc = "Generate a Makefile in a specific directory" })


-- ============================================================================
-- 3. THE MASTER COMMAND: :NewProject
-- ============================================================================

vim.api.nvim_create_user_command("NewProject", function()

    -- Helper: Writes all the boilerplate files
    local function write_boilerplate(path, name, lang, build_sys)
        if lang == "python" then
            write_file(path .. "/.gitignore", "__pycache__/\n*.pyc\n.venv/\nvenv/\n" .. name .. "\n")
            write_file(path .. "/requirements.txt", "# Add your python dependencies here\n")
            write_file(path .. "/main.py", "def main():\n    print(\"Hello from " .. name .. "!\")\n\nif __name__ == \"__main__\":\n    main()\n")
        else
            write_file(path .. "/.gitignore", "*.o\n*.out\n*.a\n*.so\n*.exe\n.cache/\ncompile_commands.json\n" .. name .. "\n")
            local ext = (lang == "c++") and "cpp" or "c"
            local std_flag = (lang == "c++") and ", -std=c++98" or ""
            local clangd = string.format("CompileFlags:\n  Add: [-Wall, -Wextra, -Werror%s]\n", std_flag)
            
            write_file(path .. "/.clangd", clangd)
            local main_content = (lang == "c++") 
                and "#include <iostream>\n\nint main(void) {\n    std::cout << \"Hello " .. name .. "\" << std::endl;\n    return 0;\n}\n"
                or "#include <stdio.h>\n\nint main(void) {\n    printf(\"Hello " .. name .. "\\n\");\n    return 0;\n}\n"
            write_file(path .. "/main." .. ext, main_content)
        end

        if build_sys == "make" then
            write_file(path .. "/Makefile", get_makefile_content(name, lang))
        elseif build_sys == "cmake" then
            local cmake_lang = (lang == "c++") and "CXX" or "C"
            local ext = (lang == "c++") and "cpp" or "c"
            local cmake_content = string.format("cmake_minimum_required(VERSION 3.10)\nproject(%s LANGUAGES %s)\n\n", name, cmake_lang)
            if lang == "c++" then
                cmake_content = cmake_content .. "set(CMAKE_CXX_STANDARD 98)\nset(CMAKE_CXX_STANDARD_REQUIRED ON)\nadd_compile_options(-Wall -Wextra -Werror)\n\n"
            else
                cmake_content = cmake_content .. "set(CMAKE_C_STANDARD 99)\nset(CMAKE_C_STANDARD_REQUIRED ON)\nadd_compile_options(-Wall -Wextra -Werror)\n\n"
            end
            cmake_content = cmake_content .. string.format("file(GLOB SOURCES \"*.%s\")\nadd_executable(${PROJECT_NAME} ${SOURCES})\n", ext)
            write_file(path .. "/CMakeLists.txt", cmake_content)
        end
    end

    -- Helper: Opens the directory at the very end
    local function ask_to_open(path)
        vim.ui.select({ "Yes", "No" }, { prompt = " Open project directory now?" }, function(choice)
            if choice == "Yes" then
                vim.cmd("cd " .. path)
                vim.cmd("edit .")
            end
        end)
    end

    -- CORE LOGIC
    vim.ui.input({ prompt = " Project Name: " }, function(name)
        if not name or name == "" then return end

        vim.ui.select({ "c++", "c", "python" }, { prompt = "  Select Language:" }, function(lang)
            if not lang then return end

            local function proceed_with_git(build_sys)
                vim.ui.select({ "Yes", "No" }, { prompt = "󰌹 Link to an existing GitHub repo?" }, function(link)
                    local path = vim.fn.getcwd() .. "/" .. name
                    
                    -- PATH A: Clone Existing Repo First
                    if link == "Yes" then
                        local default_user = vim.fn.system("git config --global user.name"):gsub("%s+", "")
                        if default_user == "" then default_user = "Yosskavo" end
                        vim.ui.input({ prompt = " GitHub Username: ", default = default_user }, function(user)
                            if not user or user == "" then return end
                            vim.ui.input({ prompt = "󰏖 Repo Name: ", default = name }, function(repo)
                                if not repo or repo == "" then repo = name end
                                vim.ui.select({ "SSH", "HTTPS" }, { prompt = "󰒃 Protocol:" }, function(protocol)
                                    protocol = protocol or "SSH"
                                    local remote_url = (protocol == "HTTPS") 
                                        and ("https://github.com/" .. user .. "/" .. repo .. ".git") 
                                        or ("git@github.com:" .. user .. "/" .. repo .. ".git")
                                    
                                    vim.notify(" Cloning " .. repo .. "...", vim.log.levels.INFO, { title = "Git Clone" })
                                    
                                    -- Run clone asynchronously so UI doesn't freeze
                                    vim.fn.jobstart({"git", "clone", remote_url, path}, {
                                        -- vim.schedule_wrap ensures UI popups don't crash the background thread
                                        on_exit = vim.schedule_wrap(function(_, exit_code)
                                            if exit_code == 0 then
                                                -- Ask to inject boilerplate into the freshly cloned repo
                                                vim.ui.select({ "Yes", "No" }, { prompt = "󰉍 Cloned! Inject boilerplate (Makefile, .clangd, etc.)?" }, function(boiler)
                                                    if boiler == "Yes" then
                                                        write_boilerplate(path, name, lang, build_sys)
                                                        vim.fn.system({"git", "-C", path, "add", "."})
                                                        vim.notify("󰉗 Boilerplate injected into " .. repo, vim.log.levels.INFO)
                                                    end
                                                    ask_to_open(path)
                                                end)
                                            else
                                                vim.notify("󰉘 Failed to clone " .. repo .. ". Check SSH/URL.", vim.log.levels.ERROR)
                                            end
                                        end)
                                    })
                                end)
                            end)
                        end)
                        
                    -- PATH B: Local Init
                    else
                        local default_branch = vim.fn.system("git config --global init.defaultBranch"):gsub("%s+", "")
                        if default_branch == "" then default_branch = "main" end
                        
                        vim.ui.input({ prompt = " Initial Branch: ", default = default_branch }, function(branch)
                            if not branch or branch == "" then branch = default_branch end
                            
                            vim.fn.mkdir(path, "p")
                            vim.fn.system({"git", "init", "--initial-branch=" .. branch, path})
                            
                            write_boilerplate(path, name, lang, build_sys)
                            vim.fn.system({"git", "-C", path, "add", "."})
                            
                            vim.notify(" Bootstrapped project: " .. name .. " on branch '" .. branch .. "'", vim.log.levels.INFO, { title = "Project Generator" })
                            ask_to_open(path)
                        end)
                    end
                end)
            end

            if lang == "python" then
                proceed_with_git("make")
            else
                vim.ui.select({ "make", "cmake" }, { prompt = "🛠️ Select Build System:" }, function(build_sys)
                    if build_sys then proceed_with_git(build_sys) end
                end)
            end
        end)
    end)

end, { desc = "Interactive Multi-Lang Project Generator" })

-- ============================================================================
-- 4. SEARCH GIT PROJECTS (All normal & hidden git repos)
-- ============================================================================

local function get_git_branch(path)
    local head_file = io.open(path .. "/.git/HEAD", "r")
    if not head_file then return "" end
    local content = head_file:read("*l") or ""
    head_file:close()
    local branch = content:match("ref: refs/heads/(.+)")
    if branch then
        return branch
    elseif #content > 0 then
        return content:sub(1, 7)
    end
    return ""
end

local function find_all_git_projects()
    local cmd
    if vim.fn.executable("fd") == 1 then
        cmd = {
            "fd", "-H", "-I", "-t", "d", "^\\.git$", vim.fn.expand("~"),
            "--max-depth", "6",
            "-E", ".cache",
            "-E", ".local/share/nvim",
            "-E", ".local/share/Trash",
            "-E", ".trash",
            "-E", ".cargo",
            "-E", ".rustup",
            "-E", "node_modules",
            "-E", ".venv",
            "-E", "venv",
            "-x", "echo", "{//}"
        }
    else
        cmd = {
            "sh", "-c",
            [[find "$HOME" -maxdepth 6 -name .git -type d \
                -not -path "*/.cache/*" \
                -not -path "*/.local/share/nvim/*" \
                -not -path "*/.local/share/Trash/*" \
                -not -path "*/.trash/*" \
                -not -path "*/.cargo/*" \
                -not -path "*/.rustup/*" \
                -not -path "*/node_modules/*" \
                2>/dev/null | sed "s|/\.git$||"]]
        }
    end

    local obj = vim.system(cmd):wait()
    local raw_lines = vim.split(obj.stdout or "", "\n", { trimempty = true })
    local seen = {}
    local projects = {}
    local home = vim.fn.expand("~")

    for _, p in ipairs(raw_lines) do
        if not seen[p] and vim.fn.isdirectory(p) == 1 then
            seen[p] = true
            local name = vim.fn.fnamemodify(p, ":t")
            local display_path = p
            if p:sub(1, #home) == home then
                display_path = "~" .. p:sub(#home + 1)
            end
            local branch = get_git_branch(p)
            table.insert(projects, {
                path = p,
                name = name,
                display_path = display_path,
                branch = branch,
            })
        end
    end

    table.sort(projects, function(a, b)
        return a.name:lower() < b.name:lower()
    end)

    return projects
end

local function search_git_projects(opts)
    opts = opts or {}

    -- Ensure telescope is loaded
    local ok_t, _ = pcall(require, "telescope")
    if not ok_t then
        local ok_l, lazy = pcall(require, "lazy")
        if ok_l then
            lazy.load({ plugins = { "telescope.nvim" } })
        end
    end

    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")
    local entry_display = require("telescope.pickers.entry_display")

    local projects = find_all_git_projects()
    if #projects == 0 then
        vim.notify("No git projects found!", vim.log.levels.WARN, { title = "Git Projects" })
        return
    end

    local displayer = entry_display.create({
        separator = " ",
        items = {
            { width = 2 },
            { width = 24 },
            { width = 14 },
            { remaining = true },
        },
    })

    local function make_display(entry)
        return displayer({
            { "", "Directory" },
            { entry.name, "Title" },
            { entry.branch ~= "" and (" " .. entry.branch) or "", "Comment" },
            { entry.display_path, "Comment" },
        })
    end

    pickers.new(opts, {
        prompt_title = "Git Projects (<CR>: Files | <C-e>: Oil | <C-g>: LazyGit | <C-w>: cd)",
        finder = finders.new_table({
            results = projects,
            entry_maker = function(entry)
                return {
                    value = entry.path,
                    display = make_display,
                    ordinal = entry.name .. " " .. entry.display_path .. " " .. entry.branch,
                    name = entry.name,
                    display_path = entry.display_path,
                    branch = entry.branch,
                }
            end,
        }),
        sorter = conf.generic_sorter(opts),
        attach_mappings = function(prompt_bufnr, map)
            local function select_project(action_type)
                local selection = action_state.get_selected_entry()
                actions.close(prompt_bufnr)
                if not selection then return end

                local project_path = selection.value

                -- Change directory
                vim.fn.chdir(project_path)

                -- Sync with telescope-project if available
                local ok, proj_actions = pcall(require, "telescope._extensions.project.actions")
                if ok and proj_actions.add_project_path then
                    pcall(proj_actions.add_project_path, project_path)
                end

                if action_type == "find_files" then
                    vim.schedule(function()
                        require("telescope.builtin").find_files({ cwd = project_path })
                    end)
                elseif action_type == "oil" then
                    vim.schedule(function()
                        local oil_ok, oil = pcall(require, "oil")
                        if oil_ok then
                            oil.open(project_path)
                        else
                            vim.cmd("edit " .. vim.fn.fnameescape(project_path))
                        end
                    end)
                elseif action_type == "lazygit" then
                    vim.schedule(function()
                        vim.cmd("LazyGit")
                    end)
                elseif action_type == "tab" then
                    vim.cmd("tabnew")
                    vim.fn.chdir(project_path)
                    vim.schedule(function()
                        require("telescope.builtin").find_files({ cwd = project_path })
                    end)
                elseif action_type == "cd" then
                    vim.notify("󰉍 Switched directory to: " .. selection.display_path, vim.log.levels.INFO)
                end
            end

            actions.select_default:replace(function()
                select_project("find_files")
            end)

            map("i", "<C-e>", function() select_project("oil") end)
            map("n", "e", function() select_project("oil") end)
            map("i", "<C-o>", function() select_project("oil") end)
            map("n", "o", function() select_project("oil") end)
            map("i", "<C-g>", function() select_project("lazygit") end)
            map("n", "g", function() select_project("lazygit") end)
            map("i", "<C-w>", function() select_project("cd") end)
            map("n", "w", function() select_project("cd") end)
            map("i", "<C-t>", function() select_project("tab") end)
            map("n", "t", function() select_project("tab") end)

            return true
        end,
    }):find()
end

vim.api.nvim_create_user_command("SearchGitProjects", function()
    search_git_projects()
end, { desc = "Search all git projects (normal & hidden)" })

vim.api.nvim_create_user_command("GitProjects", function()
    search_git_projects()
end, { desc = "Search all git projects (normal & hidden)" })
