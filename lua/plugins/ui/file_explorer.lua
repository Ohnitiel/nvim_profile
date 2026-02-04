vim.pack.add(
    { { src = "https://github.com/stevearc/oil.nvim", } },
    { confirm = false }
)
vim.pack.add(
    { { src = "https://github.com/nvim-tree/nvim-web-devicons", } },
    { confirm = false }
)

require("oil").setup({
    view_options = {
        show_hidden = true,
        case_sensitive = true,
        natural = false,
    },
})
require("nvim-web-devicons").setup()

vim.keymap.set("n", "-", require("oil").open)
