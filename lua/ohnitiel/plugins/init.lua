return {

    {
        "lewis6991/gitsigns.nvim",
        current_line_blame = true,
        config = function()
            require("gitsigns").setup({
                on_attach = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    map("n", "<leader>hn", function()
                        if vim.wo.diff then return "<leader>nh" end
                        vim.schedule(function() gs.next_hunk() end)
                        return "<Ignore>"
                    end, { expr = true, desc = "Git go to next hunk" })

                    map("n", "<leader>hp", function()
                        if vim.wo.diff then return "<leader>ph" end
                        vim.schedule(function() gs.next_hunk() end)
                        return "<Ignore>"
                    end, { expr = true, desc = "Git go to previous hunk" })

                    map("n", "<leader>hs", gs.stage_hunk, { desc = "Git stage hunk" })
                    map("n", "<leader>hr", gs.reset_hunk, { desc = "Git reset hunk" })
                    map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Git undo stage hunk" })
                    map("n", "<leader>hp", gs.preview_hunk, { desc = "Git preview hunk" })
                    map("n", "<leader>hS", gs.stage_buffer, { desc = "Git stage buffer" })
                    map("n", "<leader>hR", gs.reset_buffer, { desc = "Git stage buffer" })
                    map("n", "<leader>hD", gs.diffthis, { desc = "Git diff buffer" })
                    map("n", "<leader>hd", function()
                        gs.diffthis('~' .. vim.v.count)
                    end, { desc = "Git diff buffer with head == count" })
                    map("n", "<leader>td", gs.toggle_deleted, { desc = "Git toggle deleted" })
                end
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
                suggestion_color = { gui = "#808080", cterm = 244 },
                exclude_filetypes = { "TelescopePrompt", "NvimTree" },
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
