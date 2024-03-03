return {
    "nvim-telescope/telescope.nvim",
    config = function()
        local telescope = require("telescope.builtin")

        -- Files maps
        vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
        vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
        vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope list buffers" })

        -- Git maps
        vim.keymap.set("n", "<leader>gf", telescope.git_files, { desc = "Telescope git files" })
        vim.keymap.set("n", "<leader>gc", telescope.git_commits, { desc = "Telescope git commits" })
        vim.keymap.set("n", "<leader>gs", telescope.git_stash, { desc = "Telescope git search" })

        -- LSP maps
        vim.keymap.set("n", "gr", function() telescope.lsp_references() end, { desc = "Telescope list references" })
        vim.keymap.set("n", "gi", function() telescope.lsp_implementations() end, { desc = "Telescope list implementations" })
        vim.keymap.set("n", "<leader>qf", telescope.quickfix, { desc = "Telescope quickfix" })
        vim.keymap.set("n", "<leader>D", telescope.diagnostics, { desc = "Telescope project diagnostics" })
        vim.keymap.set("n", "<leader>d", function()
            telescope.diagnostics({
                bufnr = 0
            })
        end, { desc = "Telescope buffer diagnostics" })
    end

}
