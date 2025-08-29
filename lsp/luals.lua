local dir = "/opt/lsp/"

return {
    cmd = {dir .. "lua_ls/bin/lua-language-server"},
    filetypes = { "lua" },
    settings = {
        Lua = {
            diagnostics = {
                disable = {
                    "missing-parameters",
                    "missing-fields",
                },
            },
        }
    },
}

