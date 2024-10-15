return {
    "tanvirtin/vgit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local git = require("vgit")
        git.setup()

        vim.keymap.set("n", "<C-k>", git.hunk_up)
        vim.keymap.set("n", "<C-j>", git.hunk_down)
        vim.keymap.set("n", "<leader>gs", git.buffer_hunk_stage)
        vim.keymap.set("n", "<leader>gS", git.buffer_stage)
        vim.keymap.set("n", "<leader>gU", git.buffer_unstage)
        vim.keymap.set("n", "<leader>gr", git.buffer_hunk_reset)
        vim.keymap.set("n", "<leader>gR", git.buffer_reset)
        vim.keymap.set("n", "<leader>gp", git.buffer_hunk_preview)
        vim.keymap.set("n", "<leader>gd", git.buffer_diff_preview)
        vim.keymap.set("n", "<C-g>", git.project_commit_preview)
    end
}
