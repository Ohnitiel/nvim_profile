return {
    "stevearc/oil.nvim",

    config = function()
        require("oil").setup({
            columns = {
                "icon"
            },
            view_options = {
                show_hidden = true
            },
        })

        vim.keymap.set("n", "-", require("oil").open, { desc = "Open parent directory" })
    end,

    dependencies = {
        "nvim-tree/nvim-web-devicons",
    }
}
