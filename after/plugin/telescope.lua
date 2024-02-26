local telescope = require("telescope.builtin")

-- Files maps
vim.keymap.set("n", "<leader>ff", telescope.find_files, {})
vim.keymap.set("n", "<leader>fg", telescope.live_grep, {})
vim.keymap.set("n", "<leader>fb", telescope.buffers, {})

-- Git maps
vim.keymap.set("n", "<leader>gf", telescope.git_files, {})
vim.keymap.set("n", "<leader>gc", telescope.git_commits, {})
vim.keymap.set("n", "<leader>gs", telescope.git_stash, {})

-- LSP maps
vim.keymap.set("n", "gr", function() telescope.lps_references() end)
vim.keymap.set("n", "gi", function() telescope.lps_implementations() end)
vim.keymap.set("n", "<leader>qf", telescope.quickfix, {})
vim.keymap.set("n", "<leader>D", telescope.diagnostics, {})
vim.keymap.set("n", "<leader>d", function()
    telescope.diagnostics({
        bufnr = 0
    })
end)
