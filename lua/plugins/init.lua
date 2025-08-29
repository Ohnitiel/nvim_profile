vim.pack.add(
    { { src = "https://github.com/nvim-lua/plenary.nvim" } },
    { confirm = false }
)

vim.pack.add(
    { { src = "https://github.com/mbbill/undotree" } },
    { confirm = false }
)

require("plugins.ui")
require("plugins.lsp")
require("plugins.fuzzy-finder")
require("plugins.treesitter")
require("plugins.git")

vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
