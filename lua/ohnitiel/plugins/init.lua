return {

    {
        "roobert/surround-ui.nvim",
        dependencies = {
            "kylechui/nvim-surround",
            "folke/which-key.nvim",
        },
        config = function()
            require("nvim-surround").setup()
            require("surround-ui").setup({
                root_key = "S"
            })
        end
    },

    {
        "simrat39/symbols-outline.nvim",
        config = function()
            require("symbols-outline").setup({})
            vim.keymap.set("n", "<leader><leader>", function()
                vim.cmd("SymbolsOutline")
            end, { desc = "Toggle symbols sidebar" })
        end
    },

    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })
        end
    },

    {
        "nanotee/sqls.nvim",
        config = function()
            require("lspconfig").sqls.setup({
                on_attach = function(client, bufnr)
                    require("sqls").on_attach(client, bufnr)
                end
            })
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
        "Exafunction/codeium.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            require("codeium").setup({
                config_path = os.getenv("HOME") .. "/.config/codeium/config.json"
            })
        end
    },

    {
        "radyz/telescope-gitsigns",
        dependencies = {
            "lewis6991/gitsigns.nvim",
            "nvim-telescope/telescope.nvim",
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
                sync_install = false,
                highlight = {
                    enable = true,
                    disable = function(lang, buf)
                        local max_filesize = 5 * 1024 * 1024 -- 5MB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end
                },
                indent = { enable = true },
                auto_install = false,
                ignore_install = {},
            })
        end
    },
}
