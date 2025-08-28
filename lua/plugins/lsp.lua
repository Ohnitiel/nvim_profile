return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "stevearc/conform.nvim",

        {
            "hrsh7th/nvim-cmp",
            dependencies = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-cmdline",
                "hrsh7th/cmp-vsnip",
                "hrsh7th/vim-vsnip",
                "SergioRibera/cmp-dotenv",
            },
            opts = function(_, opts)
                opts.sources = opts.sources or {}
                table.insert(opts.sources, {
                    name = "lazydev",
                    group_index = 0,
                })
            end,
        },

        {
            "Exafunction/codeium.nvim",
            dependencies = {
                "nvim-lua/plenary.nvim",
                "hrsh7th/nvim-cmp",
            },
        },

        {
            "folke/lazydev.nvim",
            ft = "lua",
        },
    },

    config = function()
        require("mason").setup()
        require("lazydev").setup()
        require("codeium").setup({
            config_path = os.getenv("HOME") .. "/.config/codeium/config.json",
        })

        local home = os.getenv("HOME")
        local masonpath = home .. "/.local/share/nvim/mason/bin/"
        local conform = require("conform")
        conform.setup({
            log_level = vim.log.levels.DEBUG,
            formatters = {
                sqruff = {
                    cwd = require("conform.util").root_file({".sqruff"}),
                },
                pg_format = {
                    append_args = { "-f", "2", "-L", "-s", "2", "-U", "2" },
                },
            },
            formatters_by_ft = {
                lua = { "stylua" },
                sql = { "pg_format" },
                go = { "gofumpt" },
            },
        })
        vim.keymap.set("n", "<F3>", function()
            conform.format({ async = true, lsp_fallback = true })
        end, {})

        local feedkey = function(key, mode)
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
        end

        local cmp = require("cmp")
        cmp.setup({
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end,
            },

            windows = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "codeium" },
                { name = "dotenv" },
            }, {
                { name = "vsnip" },
            }, {
                { name = "buffer" },
            }),

            mapping = {
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-l>"] = cmp.mapping(function()
                    if vim.fn["vsnip#available"](1) == 1 then
                        feedkey("<Plug>(vsnip-expand-or-jump)", "")
                    end
                end, { "i", "s" }),
                ["<C-h>"] = cmp.mapping(function()
                    if vim.fn["vsnip#jumpable"](-1) == 1 then
                        feedkey("<Plug>(vsnip-jump-prev)", "")
                    end
                end),
            },
        })

        cmp.setup.cmdline({ ":" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({ { name = "cmdline" } }, { { name = "path" }, { name = "buffer" } }),
            matching = {
                disallow_symbol_nonprefix_matching = false,
            },
        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = { { name = "buffer" } },
        })

        local lsp = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local handlers = {
            function(server)
                lsp[server].setup({
                    capabilities = capabilities,
                })

                lsp.lua_ls.setup({
                    capabilities = capabilities,
                    settings = {
                        Lua = {
                            diagnostics = {
                                globals = { "vim" },
                                disable = {
                                    "missing-parameters",
                                    "missing-fields",
                                },
                            },
                        },
                    },
                })

                lsp.jdtls.setup({
                    capabilities = capabilities,
                    init_options = {
                        bundles = {
                            vim.p.masonpath
                            .. "/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
                        },
                    },
                })
            end,
        }

        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls" },
            handlers = handlers,
            automatic_installation = false,
        })

        vim.api.nvim_create_autocmd("LSPAttach", {
            callback = function(ev)
                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                if not client then
                    return
                end

                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                vim.keymap.set("n", "grd", vim.lsp.buf.definition, { buffer = ev.buf })
                vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { buffer = ev.buf })
            end,
        })
    end,
}
