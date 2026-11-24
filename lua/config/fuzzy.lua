local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>r", builtin.resume)

vim.keymap.set("n", "<leader>gw", builtin.grep_string)
vim.keymap.set("v", "<leader>gw", function()
    builtin.grep_string({ search = get_visual_selection() })
end)
vim.keymap.set("n", "<leader>gW", function()
    builtin.grep_string({ search = vim.fn.expand("<cWORD>") })
end)

vim.keymap.set("n", "<leader>gb", builtin.git_branches)
vim.keymap.set("n", "<leader>gc", builtin.git_commits)

vim.keymap.set("n", "/", builtin.current_buffer_fuzzy_find)
vim.keymap.set("n", "?", builtin.current_buffer_fuzzy_find)
