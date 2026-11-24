vim.filetype.add({
    filename = {
	['compose.yaml'] = 'docker-compose',
    },
})
return {
    cmd = { vim.p.masonpath .. "bin/lua-language-server" },
    filetypes = { "dockerfile", "docker-compose" },
}
