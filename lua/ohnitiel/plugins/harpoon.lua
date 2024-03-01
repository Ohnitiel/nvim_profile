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

        vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end, { desc = "Append to Harpoon" })
        vim.keymap.set("n", "<leader>e", function() harpoon:list():remove() end, { desc = "Remove from Harpoon" })
        vim.keymap.set("n", "<leader>clear", function() harpoon:list():clear() end, { desc = "Clear Harpoon list" })

        vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end, { desc = "Go to Harpoon 1" })
        vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end, { desc = "Go to Harpoon 2" })
        vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end, { desc = "Go to Harpoon 3" })
        vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end, { desc = "Go to Harpoon 4" })

        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
            local file_paths = {}
            for _, item in ipairs(harpoon_files.items) do
                table.insert(file_paths, item.value)
            end

            require("telescope.pickers").new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                    results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
            }):find()
        end

        vim.keymap.set("n", "<leader>	", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)
        -- vim.keymap.set("n", "<leader>	", function() toggle_telescope(harpoon:list()) end,
        -- 	{desc = "Open Harpoon window" })
    end
}
