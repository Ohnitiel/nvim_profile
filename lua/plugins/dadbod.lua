return {
    "tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
    "kristijanhusak/vim-dadbod-ui",

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

        for _, v in pairs(databases) do
            databases = v
        end

        print(databases[1]['name'])

        _G.dbs = databases
    end,
}
