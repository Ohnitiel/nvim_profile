return {
    "stevearc/oil.nvim",

    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        require("oil").setup({
            view_options = {
                show_hidden = true
            }
        })
        require("nvim-web-devicons").setup({})

        vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
    end
}
