return { {
    "mbbill/undotree",

    function()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
    end
} }
