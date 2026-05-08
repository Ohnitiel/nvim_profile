vim.pack.add(
    { {
        src = "https://github.com/pmizio/typescript-tools.nvim",
    } },
    { confirm = false }
)

require("typescript-tools").setup({ })
