return {
    "stevearc/conform.nvim",

    config = function()
        require("conform").setup({
            formatters_by_ft = {
                javascript = { "prettierd" },
                typescript = { "prettierd" },
                sql = { "sql_formatter" },
                json = { "jq" },
                sh = { "beautysh" },
                php = { "pint" },
                python = { "autopep8" },
            },
            formatters = {
                sql_formatter = {
                    args = { "-c", tostring(vim.fs.find("sql-formatter.json", { upward = true })[1]) }
                },
            },
        })
        vim.keymap.set("n", "<F3>",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end)
    end
}
