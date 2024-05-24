return {
    "mbbill/undotree",

    config = true,

    keys = {
        {"<leader>u", vim.cmd.UndotreeToggle, desc = "Toggle Undotree"},
    },
    -- function()
    --     vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    -- end
}
