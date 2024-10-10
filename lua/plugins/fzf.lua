return {
    "ibhagwan/fzf-lua",

    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
        local fzf = require("fzf-lua")
        vim.keymap.set("n", "<leader>ff", fzf.files)
        vim.keymap.set("n", "<leader>r", fzf.resume)
        vim.keymap.set("n", "<leader>fg", fzf.grep)

        vim.keymap.set("n", "<leader>gw", fzf.grep_cword)
        vim.keymap.set("n", "<leader>gW", fzf.grep_cWORD)
        vim.keymap.set("v", "<leader>gw", fzf.grep_visual)

        vim.keymap.set("n", "<leader>gf", fzf.git_files)
        vim.keymap.set("n", "<leader>gc", fzf.git_commits)

        vim.keymap.set("n", "<leader>d", fzf.diagnostics_document)
        vim.keymap.set("n", "<leader>D", fzf.diagnostics_workspace)
    end
}
