return { {
    "hrsh7th/nvim-cmp",

    requires = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-nvim-lsp-signature-help",
        "ray-x/cmp-treesitter",
        "lukas-reineke/cmp-rg",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },

    function()
        local cmp = require("cmp")

        cmp.setup {
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "nvim_lsp_signature_help" },
                { name = "treesitter" },
                { name = "rg" },
                { name = "codeium" },
            }, {
                { name = "buffer" },
            }),

            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },

            mapping = {
                ["<tab>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
                ["<s-tab>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
                ["<down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
                ["<up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
                ["<c-d>"] = cmp.mapping.scroll_docs(-4),
                ["<c-f>"] = cmp.mapping.scroll_docs(4),
                ["<c-space>"] = cmp.mapping.complete(),
                ["<c-e>"] = cmp.mapping.close(),
                ["<cr>"] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.Replace,
                    select = true,
                },
            },
        }

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
                { name = "cmdline" },
                -- { name = "codeium" },
            })
        })
    end,
} }
