return {
    "mbbill/undotree",

    config = function()
        require("undotree").setup()
    end,

    keys = {
        {"<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree"},
    },
}
