return {

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
        config = function ()
            require("which-key").setup({})
        end
    },
    "mbbill/undotree",
    "lewis6991/gitsigns.nvim",

    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    },

    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
        }
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
