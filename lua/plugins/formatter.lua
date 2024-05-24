return { {
    "stevearc/conform.nvim",

    function()
        require("conform").setup({
            formatters_by_ft = {
                javascript = { "prettierd" },
                typescript = { "prettierd" },
                sql = { "sql_formatter" },
                json = { "jq" },
                sh = { "beautysh" },
                php = { "pint" },
            },
            formatters = {
                sql_formatter = {
                    args = { "-c", tostring(vim.fs.find("sql-formatter.json", { upward = true })[1]) }
                },
            },
        })
        vim.keymap.set("n", "<F3>", function() require("conform").format({ async = true, lsp_fallback = true }) end)
    end
} }
