-- Custom filetype detection using modern Neovim API
vim.filetype.add({
    extension = {
        inv = "inv",   -- Custom filetype for inverted-lang
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

-- Map Tree-sitter to use the Odin parser for 'inv' files (syntax only, no Odin LSP)
pcall(function()
    vim.treesitter.language.register("odin", "inv")
end)

-- Set comment format for 'inv' buffers
vim.api.nvim_create_autocmd("FileType", {
    pattern = "inv",
    callback = function(args)
        vim.bo[args.buf].commentstring = "// %s"
    end,
})
