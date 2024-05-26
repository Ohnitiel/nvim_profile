return {
    "kristijanhusak/vim-dadbod-ui",

    dependencies = {
        "tpope/vim-dadbod",
        "kristijanhusak/vim-dadbod-completion",
    },

    config = function()
        vim.g.db_ui_table_helpers = {
            postgresql = {
                count = "SELECT COUNT(*) FROM {table}",
                list = "SELECT * FROM {table} LIMIT 50",
            }
        }

        vim.g.db_ui_use_nerd_fonts = 1

        local json = require("functions.json")

        local db_file = io.input(os.getenv("HOME") .. "/.dotfiles/databases.json")
        local content = io.read("*a")
        local databases = json.from_string(content)
        io.close(db_file)

        vim.g.dbs = databases['databases']
    end,
}
