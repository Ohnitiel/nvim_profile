return {
    cmd = { "ty", "server" },
    filetypes = { "python" },
    root_dir = vim.fs.root(0, {"pyproject.toml", "requirements.txt"}),
}
