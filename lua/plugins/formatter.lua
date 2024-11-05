return {
    "stevearc/conform.nvim",

    config = function()
        require("conform").setup({
            formatters_by_ft = {
                go = { "gofumpt" },
                javascript = { "prettierd" },
                json = { "jq" },
                php = { "pint" },
                python = { "ruff" },
                sh = { "beautysh" },
                sql = { "pg_format" },
                typescript = { "prettierd" },
            },
            formatters = {
                pg_format = {
                    prepend_args = { "-s", "2", "-U", "2" }
                },
            },
        })
        vim.keymap.set("n", "<F3>",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end)
    end
}
