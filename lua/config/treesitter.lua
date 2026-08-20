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

  -- Auto-install missing parsers from ensure_installed
  if opts and opts.ensure_installed then
    local ok_config, ts_config = pcall(require, "nvim-treesitter.config")
    local ok_install, ts_install = pcall(require, "nvim-treesitter.install")
    if ok_config and ok_install then
      local installed = ts_config.get_installed()
      local installed_set = {}
      for _, lang in ipairs(installed) do
        installed_set[lang] = true
      end

      local to_install = {}
      for _, lang in ipairs(opts.ensure_installed) do
        if not installed_set[lang] then
          table.insert(to_install, lang)
        end
      end

      if #to_install > 0 then
        ts_install.install(to_install)
      end
    end
  end

  pcall(function()
    vim.treesitter.language.register("bash", "zsh")
  end)
end


