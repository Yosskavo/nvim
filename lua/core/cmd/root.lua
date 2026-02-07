-- Function to find the root directory
local function change_nvim_root()
  -- Look for these files/folders to identify the "root"
  local root_markers = { ".git", "Makefile", "package.json", ".sln" }
  local file_path = vim.api.nvim_buf_get_name(0)

  -- If we aren't in a real file, don't do anything
  if file_path == "" then return end

  -- Find the directory containing one of the markers
  local root = vim.fs.find(root_markers, { upward = true, path = file_path })[1]

  if root then
    local root_dir = vim.fs.dirname(root)
    vim.fn.chdir(root_dir)
  end
end

-- Run the function whenever you enter a new buffer
vim.api.nvim_create_autocmd("BufEnter", {
  callback = change_nvim_root,
})
