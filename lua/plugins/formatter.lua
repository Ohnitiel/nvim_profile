return { {
    "stevearc/conform.nvim",

    setup = function()
        vim.g.conform_config = {
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
        }
    end,

    function()
        vim.keymap.set("n", "<F3>", function() require("conform").format({ async = true, lsp_fallback = true }) end)
    end
} }
