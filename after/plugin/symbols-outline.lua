require("symbols-outline").setup({})
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("SymbolsOutline")
end, { desc = "Toggle symbols sidebar" })
