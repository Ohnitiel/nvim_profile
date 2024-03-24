return {
    "neogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        require("neogit").setup({})
        local ng = require("neogit")

        vim.keymap.set("n", "<C-g>", function() ng.open() end, { desc = "Open Git" })
    end,

}
