local M = {}

-- Store the state in Neovim's standard data directory
local state_file = vim.fn.stdpath("data") .. "/persistent_toggles.json"

-- Load the entire state dictionary from the file
function M.load()
  if vim.fn.filereadable(state_file) == 1 then
    local f = io.open(state_file, "r")
    if f then
      local content = f:read("*a")
      f:close()
      if content and content ~= "" then
        local ok, data = pcall(vim.json.decode, content)
        if ok then
          return data
        end
      end
    end
  end
  return {}
end

-- Save the dictionary back to the file
function M.save(data)
  local f = io.open(state_file, "w")
  if f then
    f:write(vim.json.encode(data))
    f:close()
  end
end

-- Get a value, fallback to default if it doesn't exist
function M.get(key, default)
  local data = M.load()
  if data[key] == nil then
    return default
  end
  return data[key]
end

-- Set a value and save it
function M.set(key, value)
  local data = M.load()
  data[key] = value
  M.save(data)
end

-- Toggle a boolean value permanently
function M.toggle(key, default)
  local data = M.load()
  local current = data[key]
  if current == nil then
    current = default
  end
  data[key] = not current
  M.save(data)
  return data[key]
end

return M
