return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "hrsh7th/nvim-cmp",
        "folke/neodev.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        require("neodev").setup({})
        require("mason").setup()

        require("mason-tool-installer").setup({
            ensure_installed = {
                "pyright", "lua_ls", "phpactor", "angularls",
                "tsserver", "bashls", "prettierd", "sql-formatter",
                "jq",
            },
        })
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
        local lspconfig = require("lspconfig")
        local handlers = {
            function(server_name) -- default handler (optional)
                lspconfig[server_name].setup({
                    capabilities = capabilities
                })
            end,

            ["lua_ls"] = function()
                lspconfig.lua_ls.setup({
                    settings = {
                        Lua = {
                            completion = { callSnippet = "Replace" }
                        }
                    },
                    capabilities = capabilities,
                    diagnostics = { disable = { 'missing-fields' } },
                })
            end,
        }

        require("mason-lspconfig").setup({ handlers = handlers, })


        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = ev.buf, desc = "LSP go to declaration", })
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = ev.buf, desc = "LSP go to definition", })
                vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = ev.buf, desc = "LSP hover", })
                vim.keymap.set("n", "<leader>fs", require("telescope.builtin").lsp_document_symbols,
                    { buffer = ev.buf, desc = "Search current buffer symbols", })
                vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols,
                    { buffer = ev.buf, desc = "Search current workspace symbols", })
                vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, { buffer = ev.buf, desc = "LSP rename", })
                vim.keymap.set("n", "<F4>", function()
                    vim.lsp.buf.code_action({ apply = true })
                end, { buffer = ev.buf, desc = "LSP code action", })
            end
        })
    end
}
