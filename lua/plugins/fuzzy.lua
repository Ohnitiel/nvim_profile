return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },

    config = function()
        require("telescope").setup({
            pickers = {
                find_files = {
                    theme = "ivy",
                },
            },
            extensions = {
                fzf = {}
            }
        })
        require("telescope").load_extension("fzf")
        local builtin = require("telescope.builtin")

        vim.keymap.set("n", "<leader>r", builtin.resume)
        vim.keymap.set("n", "<leader>ff", builtin.find_files)
        vim.keymap.set("n", "<leader>vi", function()
            builtin.find_files({
                cwd = os.getenv("HOME") .. "/.config/nvim",
            })
        end)
        vim.keymap.set("n", "<leader>fi", function()
            builtin.find_files({
                cwd = "/etc/fish",
            })
        end)
        vim.keymap.set("n", "<leader>gw", builtin.grep_string)
        vim.keymap.set("n", "<leader>gW", function()
            builtin.grep_string({ search = vim.fn.expand("cWORD") })
        end)
        vim.keymap.set("n", "/", builtin.current_buffer_fuzzy_find)
    end
}
