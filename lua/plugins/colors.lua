return { {
    "EdenEast/nightfox.nvim",

    priority = 1000,

    function()
        require("nightfox").setup({
            options = {
                styles = {
                    comments = "italic",
                    functions = "bold",
                    types = "italic, bold",
                }
            }
        })
        vim.cmd.colorscheme("terafox")
    end,
} }
