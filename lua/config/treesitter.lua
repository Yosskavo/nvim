return function(_, opts)
  local has_configs, configs = pcall(require, "nvim-treesitter.configs")
  if has_configs then
    configs.setup(opts)
  else
    local has_ts, ts = pcall(require, "nvim-treesitter")
    if has_ts and ts.setup then
      ts.setup(opts)
    end
  end

  pcall(function()
    vim.treesitter.language.register("bash", "zsh")
  end)
end


