return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/nvim-cmp",
        "folke/neodev.nvim",
    },
    config = function()
        require("neodev").setup({})
        require("mason").setup()

        local capabilities = require("cmp_nvim_lsp").default_capabilities()
        local lspconfig = require("lspconfig")
        local handlers = {
            function(server_name) -- default handler (optional)
                lspconfig[server_name].setup({})
            end,

            ["lua_ls"] = function()
                lspconfig.lua_ls.setup({
                    settings = {
                        Lua = {
                            completion = { callSnippet = "Replace" }
                        }
                    },
                    capabilities = capabilities
                })
            end,

            ["intelephense"] = function()
                lspconfig.intelephense.setup({
                    capabilities = capabilities
                })
            end,

            ["pyright"] = function()
                lspconfig.pyright.setup({
                    capabilities = capabilities
                })
            end,
        }

        require("mason-lspconfig").setup({
            ensure_installed = {
                "pyright",
                "lua_ls",
                "intelephense",
                "angularls",
                "tsserver",
                "sqls",
                "bashls",
                "prettierd",
            },
            handlers = handlers,
        })


        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "LSP go to declaration", })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "LSP go to definition", })
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "LSP hover", })
                vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help,
                    { buffer = ev.buf, desc = "LSP signature help", })
                vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { buffer = ev.buf, desc = "LSP rename", })
                vim.keymap.set("n", "<F3>", function()
                    vim.lsp.buf.format({ async = true })
                end, { buffer = ev.buf, desc = "LSP format file", })
                vim.keymap.set("n", "<F4>", function()
                    vim.lsp.buf.code_action({ apply = true })
                end, { buffer = ev.buf, desc = "LSP code action", })
            end
        })
    end
}
