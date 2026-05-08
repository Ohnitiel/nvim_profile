vim.pack.add(
    { { src = "https://github.com/stevearc/conform.nvim", } },
    { confirm = false }
)

local fmt = require("conform")

fmt.setup({
    formatters = {
        stylua = {
            command = "/opt/formatter/stylua/target/release/stylua"
        },
        gofumpt = {
            command = "/opt/formatter/gofumpt"
        },
        prettierd = {
            command = "prettierd"
        }
    },
    formatters_by_ft = {
        lua = { "stylua" },
        go = { "gofumpt" },
        javascript = { "prettierd" },
        typescript = { "prettierd" },
        html = { "prettierd" },
        css = { "prettierd"},
        python = {
            "ruff_fix",
            "ruff_format",
            "ruff_organize_imports",
        },
    },
})

vim.keymap.set("n", "<F3>", function()
    fmt.format({ async = true, lsp_fallback = true })
end)
