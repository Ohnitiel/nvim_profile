local lspzero = require('lsp-zero')

lspzero.on_attach(function(client, bufnr)
    lspzero.default_keymaps({ buffer = bufnr })

    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()

    cmp.setup({
        mapping = cmp.mapping.preset.insert({
            -- `Enter` key to confirm completion
            ['<CR>'] = cmp.mapping.confirm({ select = false }),

            -- Ctrl+Space to trigger completion menu
            ['<C-Space>'] = cmp.mapping.complete(),

            -- Navigate between snippet placeholder
            ['<C-f>'] = cmp_action.luasnip_jump_forward(),
            ['<C-b>'] = cmp_action.luasnip_jump_backward(),

            -- Scroll up and down in the completion documentation
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
        })
    })
end)

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "docker_compose_language_service",
        "dockerls",
        "ruff_lsp",
        "pyright",
        "lua_ls",
        "intelephense",
    },
    handlers = {
        lspzero.default_setup,
        lua_ls = function()
            local lua_opts = lspzero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
        end,
    },
})
