return {
    cmd = { vim.p.masonpath .. "bin/lua-language-server" },
    filetypes = { "lua" },
    root_dir = vim.fs.root(0, {".git", ".luarc.json"}),
    settings = {
        Lua = {
            diagnostics = {
                disable = {
                    "missing-parameters",
                    "missing-fields",
                },
            },
            runtime = {
                version = 'LuaJIT'
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    "${3rd}/luv/library",
		    vim.fn.stdpath("data") .. "/site/pack/core/opt",
                }
            },
	    telemetry = { enabled = false, },
        }
    },
}
