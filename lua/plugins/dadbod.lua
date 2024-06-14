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

        local success, db_file = pcall(io.open(os.getenv("HOME") .. "/.dotfiles/databases.json"))
        if not success then
            return
        end
        local content = io.read("*a")
        local success, databases = pcall(json.from_string(content))
        io.close(db_file)

        if success then
            vim.g.dbs = databases['databases']
        end
    end,
}
