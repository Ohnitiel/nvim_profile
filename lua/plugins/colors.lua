return {
    "EdenEast/nightfox.nvim",

    priority = 1000,
    lazy = false,

    config = function()
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
}
