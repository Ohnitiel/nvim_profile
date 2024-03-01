return {

    "lewis6991/gitsigns.nvim",

    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle)
        end
    },

    {
        "EdenEast/nightfox.nvim",
        config = function()
            vim.cmd.colorscheme('carbonfox')
            require("nightfox").setup({
                options = {
                    styles = {
                        comments = "italic",
                        functions = "bold",
                        types = "italic, bold",
                    }
                }
            })
        end,
    },

    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("which-key").setup({})
        end
    },

    {
        "codota/tabnine-nvim",
        build = "pwsh.exe -file .\\dl_binaries.ps1",
        config = function()
            require("tabnine").setup({
                disable_auto_comment = true,
                accept_keymap = "<C-[>",
                dismiss_keymap = "<C-]>",
                debounce_ms = 650,
                suggestion_color = {gui = "#808080", cterm = 244},
                exclude_filetypes = {"TelescopePrompt", "NvimTree"},
                log_file_path = nil,
            })
        end
    },

    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                ensure_installed = {
                    "lua", "typescript", "html", "bash", "css",
                    "json", "php", "python", "scss", "sql", "toml",
                    "javascript", "yaml", "dockerfile",
                },
                sync_installed = false,
                highlight = { enable = true },
                indent = { enable = true },
                auto_install = false,
            })
        end
    },
}
