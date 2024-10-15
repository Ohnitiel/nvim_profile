return {
    "neovim/nvim-lspconfig",

    lazy = false,
    dependencies = {
        { "ms-jpq/coq_nvim",       branch = "coq" },
        { "ms-jpq/coq.artifacts",  branch = "artifacts" },
        { "ms-jpq/coq.thirdparty", branch = "3p" },
        {
            "folke/lazydev.nvim",
            ft = "lua",
            dependencies = { "Bilal2453/luvit-meta", lazy = true },
        },
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "nanotee/sqls.nvim",
    },

    init = function()
        vim.g.coq_settings = {
            auto_start = true,
        }
    end,

    config = function()
        require("mason").setup()
        require("lazydev").setup()
        local lsp = require("lspconfig")
        local coq = require("coq")

        local handlers = {
            function(server)
                lsp[server].setup({
                    capabilities = coq.lsp_ensure_capabilities()
                })
            end,

            ["sqls"] = function()
                lsp.sqls.setup({
                    capabilities = coq.lsp_ensure_capabilities(),
                    on_attach = function(client, bufnr)
                        require('sqls').on_attach(client, bufnr)
                    end
                })
            end,

            ["gopls"] = function()
                lsp.gopls.setup({
                    capabilities = coq.lsp_ensure_capabilities(),
                    gopls = {
                        gofumpt = true,
                    }
                })
            end,

            ["lua_ls"] = function()
                lsp.lua_ls.setup({
                    settings = {
                        capabilities = coq.lsp_ensure_capabilities(),
                        Lua = { completion = { callSnippet = "Replace" } },
                        diagnostics = { disable = { "missing-fields" } },
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

}
