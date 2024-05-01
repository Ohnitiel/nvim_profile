return {
    "EdenEast/nightfox.nvim",
    priority = 1000,
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
        local colorschemes = {
            "sorbet",
            "nordfox",
            "terafox",
        }
        vim.cmd.colorscheme(colorschemes[math.random(#colorschemes)])
    end,
}
