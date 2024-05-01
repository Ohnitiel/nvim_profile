return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Append to Harpoon" })
        vim.keymap.set("n", "<leader>e", function() harpoon:list():remove() end, { desc = "Remove from Harpoon" })
        vim.keymap.set("n", "<leader>clear", function() harpoon:list():clear() end, { desc = "Clear Harpoon list" })

        vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end, { desc = "Go to Harpoon 1" })
        vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end, { desc = "Go to Harpoon 2" })
        vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end, { desc = "Go to Harpoon 3" })
        vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end, { desc = "Go to Harpoon 4" })

        vim.keymap.set("n", "<leader>	", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)
    end
}
