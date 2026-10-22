-- Custom filetype detection using modern Neovim API
vim.filetype.add({
    extension = {
        inv = "odin",  -- Treat .inv (inverted-lang) files as Odin
        tpp = "cpp",
        ipp = "cpp",
        gotmpl = "gotmpl",
    },
    pattern = {
        [".*%.docker%-compose%.ya?ml"] = "yaml.docker-compose",
        [".*compose%.ya?ml"] = "yaml.docker-compose",
        [".*%.gitlab%-ci%.ya?ml"] = "yaml.gitlab",
        [".*helm.*values.*%.ya?ml"] = "yaml.helm-values",
    },
})

-- Register treesitter language alias for inv -> odin
pcall(function()
    vim.treesitter.language.register("odin", "inv")
end)
