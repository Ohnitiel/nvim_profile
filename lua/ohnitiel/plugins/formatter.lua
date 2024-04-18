return {
    'stevearc/conform.nvim',
    config = function()
        require('conform').setup({
            formatters_by_ft = {
                lua = { "stylua" },
                javascript = { "prettierd" },
                typescript = { "prettierd" },
                sql = { "sqlfmt" },
                json = { "jq" },
            }
        })

        vim.api.nvim_create_autocmd(
            "FileType",
            {
                pattern = "*",
                callback = function()
                    vim.keymap.set("n", "<F3>", function()
                        require('conform').format()
                    end
                    )
                end
            }
        )
    end
}
