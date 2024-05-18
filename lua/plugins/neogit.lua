return { {
    "neogitOrg/neogit",

    requires = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
    },

    function()
        local ng = require("neogit")
        ng.setup({})

        vim.keymap.set("n", "<C-g>", function() ng.open() end, { desc = "Open Git" })
    end,

} }
