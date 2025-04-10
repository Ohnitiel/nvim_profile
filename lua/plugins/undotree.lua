return {
    "mbbill/undotree",
    config = function()
        -- require("undotree").setup()

        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end,
}
