return {
    cmd = { "ty", "server", },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "requirements.txt" },
    settings = {
        ty = {
            experimental = {
                rename = true,
                autoImport = true
            },
        },
    },
}
