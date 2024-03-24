return {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
        { "tpope/vim-dadbod",                     lazy = true },
        { "kristijanhusak/vim-dadbod-completion", lazy = true }
    },
    config = function()
        require("config.dadbod").setup()

        vim.keymap.set("n", "<leader>-db", ":DBUIToggle<CR>", { desc = "Toggle DBUI" })
    end,
}
