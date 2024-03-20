return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "lewis6991/gitsigns.nvim" },
    config = function()
        require("telescope").setup({
            preview = { filesize_limit = 2 },
        })
        local telescope = require("telescope.builtin")

        -- Files maps
        vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
        vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
        vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope list buffers" })

        -- Grep maps
        vim.keymap.set("n", "<leader>gw", telescope.grep_string, { desc = "Telescope git files" })
        vim.keymap.set("n", "<leader>gW", function()
            telescope.grep_string({ search = vim.fn.expand("<cWORD>") })
        end, { desc = "Telescope git files" })


        vim.keymap.set("n", "<leader>h", telescope.help_tags, { desc = "Telescope nvim help" })


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

        require("telescope").load_extension("git_signs")
        vim.keymap.set("n", "<leader>gs", ":Telescope git_signs<CR>")
    end

}
