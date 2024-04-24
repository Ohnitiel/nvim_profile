return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft = {
            lua = { "stylua" },
            javascript = { "prettierd" },
            typescript = { "prettierd" },
            sql = { "sqlfmt" },
            json = { "jq" },
            sh = { "beautysh" },
        }
    },
    keys = {
        {
            '<F3>',
            function() require('conform').format({ async = true, lsp_fallback = true }) end,
            mode = '',
            desc = 'Format buffer'
        }
    }
}
