return {
    "yosskavo/shekai.nvim",
    opts = {
        transparent = true, -- Enable background transparency
        blur = true,        -- Enable soft blur background colors
    },
    config = function(_, opts)
        require("shekai").setup(opts)
    end,
}
