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
        }
    },
    formatter_by_ft = {
        lua = { "stylua" },
        go = { "gofumpt" },
    },
})

vim.keymap.set("n", "<F3>", function()
    fmt.format({ async = true, lsp_fallback = true })
end)
