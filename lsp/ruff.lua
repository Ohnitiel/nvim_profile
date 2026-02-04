return {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    root_markers = { "pyproject.toml", "requirements.txt" },
    capabilities = {
        textDocument = {
            hover = {
                enabled = false
            }
        }
    }
}
