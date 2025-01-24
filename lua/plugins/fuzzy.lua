return {
    "ibhagwan/fzf-lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local fzf = require("fzf-lua")
        fzf.setup()

        vim.keymap.set("n", "<leader>fg", fzf.live_grep)
        vim.keymap.set("n", "<leader>rfg", fzf.live_grep_resume)

        vim.keymap.set("n", "<leader>ff", fzf.files)
        vim.keymap.set("n", "<leader>rff", function()
            fzf.files({ resume = true })
        end)

        vim.keymap.set("n", "<leader>gf", fzf.git_files)
        vim.keymap.set("n", "<leader>rgf", function()
            fzf.git_files({ resume = true })
        end)
        vim.keymap.set("n", "<leader>gs", fzf.git_status)
        vim.keymap.set("n", "<leader>rgs", function()
            fzf.git_status({ resume = true })
        end)

        vim.keymap.set("n", "<leader>vi", function()
            fzf.files({
                cwd = os.getenv("HOME") .. "/.config/nvim",
            })
        end)

        vim.keymap.set("n", "<leader>fi", function()
            fzf.files({
                cwd = "/etc/fish",
            })
        end)

        vim.keymap.set("n", "<leader>gw", fzf.grep_cword)
        vim.keymap.set("v", "<leader>gw", fzf.grep_visual)
        vim.keymap.set("n", "<leader>gW", fzf.grep_cWORD)
    end
}
