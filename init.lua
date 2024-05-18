require("remap")
require("options")

require("bootstrap")
require("dep") {
    modules = {
        prefix = "plugins.",
        "codeium",
        "colors",
        "harpoon",
        "neogit",
        "telescope",
        "treesitter",
        "undotree",
        "gitsigns",
        "lsp",
        "formatter"
    },
    "chaoren/vim-wordmotion",
    "nvim-lualine/lualine.nvim"
}
