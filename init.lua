require("remap")
require("options")

require("bootstrap")
require("dep") {
    modules = {
        prefix = "plugins.",
        "codeium",
        "colors",
        "completion",
        "formatter",
        "gitsigns",
        "harpoon",
        "lsp",
        "lualine",
        "neogit",
        "telescope",
        "treesitter",
        "undotree",
        "webdevicons"
    },
    "chaoren/vim-wordmotion",
}
