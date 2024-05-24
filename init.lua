require("remap")
require("options")

require("bootstrap")
require("dep") {
    modules = {
        prefix = "plugins.",
        "codeium",
        "colors",
        "completion",
        "dbee",
        "formatter",
        "gitsigns",
        "harpoon",
        "lsp",
        "lualine",
        "markdown",
        "neogit",
        "oil",
        "telescope",
        "treesitter",
        "undotree",
        "webdevicons",
    },
}
