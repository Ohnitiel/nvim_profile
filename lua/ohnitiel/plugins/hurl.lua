return {
    "jellydn/hurl.nvim",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    ft = "hurl",
    config = function()
        require("hurl").setup({
            debug = false,
            show_notification = false,
            mode = "split",
            formatters = {
                json = { "jq" },
                html = {
                    "prettierd", "--parser", "html",
                },
            },
            env_file = { "vars.env" }
        })
    end
}
