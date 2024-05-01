return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            javascript = { "prettierd" },
            typescript = { "prettierd" },
            sql = { "sql_formatter" },
            json = { "jq" },
            sh = { "beautysh" },
        },
        formatters = {
            sql_formatter = {
                args = { "-c", tostring(vim.fs.find("sql-formatter.json", { upward = true })[1]) }
            },
        },
    },
    keys = {
        {
            "<F3>",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = "",
            desc = "Format buffer",
        },
    },
}
