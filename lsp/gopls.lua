return {
    cmd = { vim.p.masonpath .. "bin/gopls" },
    filetypes = { "go" },
    settings = {
        gopls = { gofumpt = true },
    },
}
