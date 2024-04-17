vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.hurl",
    callback = function()
        vim.cmd.setf("hurl")
        vim.keymap.set({ "n", "v" }, "<F5>", ":HurlRunner<CR>", { desc = "Run selected request", buffer = true })
        vim.keymap.set({ "n", "v" }, "<leader>v", ":HurlRunnerVerbose<CR>",
            { desc = "Run selected request in verbose mode", buffer = true })
    end
})
