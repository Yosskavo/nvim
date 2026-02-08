return {
    "danymat/neogen",
    config = true,
    -- Map it to something easy to remember
    keys = {
        { "<leader>dg", ":lua require('neogen').generate()<CR>", desc = "Generate Doc" }
    },
}
