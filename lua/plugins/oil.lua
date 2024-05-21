return {{
    "stevearc/oil.nvim",

    function()
        require("oil").setup({
            columns = {
                "icon", "mtime", "permissions"
            },
            view_options = {
                show_hidden = true
            },
        })
    end,

    requires = {
        "nvim-tree/nvim-web-devicons",
    }
}}
