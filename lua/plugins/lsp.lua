return { {
    "neovim/nvim-lspconfig",

    requires = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim",
        "folke/neodev.nvim",
        "ray-x/lsp_signature.nvim",
        "artemave/workspace-diagnostics.nvim",
    },

    function()
        require("neodev").setup()
        require("mason").setup()
        require("lsp_signature").setup()

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        local lsp = require("lspconfig")

        local handlers = {
            function(server)
                lsp[server].setup({
                    capabilities = capabilities,
                    on_attach = function(client, bufnr)
                        require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
                    end
                })
            end,

            ["lua_ls"] = function()
                lsp.lua_ls.setup({
                    settings = {
                        Lua = {
                            completion = { callSnippet = "Replace" }
                        },
                        capabilities = capabilities,
                        diagnostics = { disable = { "missing-fields" },
                        }
                    }
                })
            end
        }

        require("mason-lspconfig").setup({ handlers = handlers })

        vim.api.nvim_create_autocmd("LSPAttach", {
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf })
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf })
                vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { buffer = ev.buf, desc = "LSP rename", })
                vim.keymap.set("n", "<F4>", function()
                    vim.lsp.buf.code_action({ apply = true })
                end, { buffer = ev.buf, desc = "LSP code action", })
            end
        })
    end
} }
