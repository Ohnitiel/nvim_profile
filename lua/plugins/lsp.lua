local function custom_attach(client, bufnr)
    require("lsp_signature").on_attach({
        bind = true,
        use_lspsaga = false,
        floating_window = true,
        fix_pos = true,
        hint_enable = true,
        hi_parameter = "Search",
        handler_opts = { "double" }
    })
end

return {
    "neovim/nvim-lspconfig",

    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim",
        "folke/neodev.nvim",
        "ray-x/lsp_signature.nvim",
        "artemave/workspace-diagnostics.nvim",
        "sqls-server/sqls.vim",
        "nanotee/sqls.nvim",
    },

    config = function()
        require("neodev").setup()
        require("mason").setup()
        require("lsp_signature").setup()
        local lsp = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        local ahk2_lsp = {
            autostart = true,
            cmd = {
                "node",
                vim.fn.expand("~/.local/share/nvim/mason/bin/ahk2_lsp"),
                "--stdio"
            },
            filetypes = { "ahk", "autohotkey", "ah2" },
            init_options = {
                locale = "en-us",
                InterpreterPath = "/mnt/c/Users/ricardo.leitinho/AppData/Local/Programs/AutoHotkey/v2/AutoHotkey.exe"
            },
            single_file_support = true,
            flags = { debounce_text_change = 300 },
            capabilities = capabilities,
            on_attach = custom_attach
        }

        local configs = require("lspconfig.configs")
        configs["ahk2"] = { default_config = ahk2_lsp }
        lsp.ahk2.setup({})

        local handlers = {
            function(server)
                lsp[server].setup({
                    capabilities = capabilities,
                    on_attach = function(client, bufnr)
                        require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
                    end
                })
            end,

            ["gopls"] = function()
                lsp.gopls.setup({
                    capabilities = capabilities,
                    gopls = {
                        gofumpt = true,
                    }
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
            end,

            ["sqls"] = function()
                lsp.sqls.setup({
                    on_attach = function(client, bufnr)
                        require("sqls").on_attach(client, bufnr)
                    end
                })
            end,
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
