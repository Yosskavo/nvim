return {
    "yosskavo/shekai.nvim",
    lazy = false,
    priority = 1000,
    opts = {
        transparent = true, -- Enable background transparency
        blur = true,        -- Enable soft blur background colors
    },
    config = function(_, opts)
        require("shekai").setup(opts)
        vim.cmd("colorscheme shekai")
    end,
}
