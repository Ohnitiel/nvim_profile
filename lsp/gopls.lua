return {
    cmd = { vim.fs.abspath("~/go/bin/gopls") },
    filetypes = { "go" },
    settings = {
        gopls = { gofumpt = true },
    },
}
