vim.pack.add(
    { { src = "https://github.com/datsfilipe/vesper.nvim", } },
    { confirm = false }
)

require("vesper").setup({ transparent = false, })
vim.cmd("colorscheme vesper")
