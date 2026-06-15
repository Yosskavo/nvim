return {
    'MeanderingProgrammer/render-markdown.nvim',
    --- @module 'render-markdown'
    --- @type render.md.UserConfig
    config = function()
        require('render-markdown').setup({
          latex = { enabled = false },
		})
    end,
}
