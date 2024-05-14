return {

    {
        "ellisonleao/dotenv.nvim",
        config = function()
            require("dotenv").setup({
                enable_on_load = true,
                verbose = false
            })
        end
    },

    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
            "nvim-treesitter/nvim-treesitter",
            "hrsh7th/nvim-cmp"
        },
        config = function()
            require("noice").setup({
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    }
                }
            })
        end
    },

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
        "mbbill/undotree",
        config = function()
            vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = "Toggle undotree" })
        end
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
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "lua", "typescript", "html", "bash", "css",
                    "json", "php", "python", "scss", "sql", "toml",
                    "javascript", "yaml", "dockerfile", "vimdoc",
                    "hurl", "markdown", "markdown_inline"
                },
                sync_install = false,
                highlight = {
                    enable = true,
                    disable = function(_, buf)
                        local max_filesize = 5 * 1024 * 1024 -- 5MB
                        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = false,
                },
                indent = { enable = true },
                auto_install = false,
            })
        end
    },

    {
        "MeanderingProgrammer/markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        name = "render-markdown",
        config = function()
            require("render-markdown").setup({})
        end,
    },

    {
        "kndndrj/nvim-dbee",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        build = function()
            require("dbee").install()
        end,
        config = function()
            require("dbee").setup({
                sources = {
                    require("dbee.sources").EnvSource:new("DB_CONNECTIONS"),
                },
            })
        end,
    },

    {
        "artemave/workspace-diagnostics.nvim",
        config = true
    },
}
