return {
    "neogitOrg/neogit",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
    },

    config = true,

    keys = {
        {"<C-g>", ":Neogit<CR>", desc = "Open Git"},
    },

    -- function()
    --     local ng = require("neogit")
    --     ng.setup({})
    --
    --     vim.keymap.set("n", "<C-g>", function() ng.open() end, { desc = "Open Git" })
    -- end,

}
