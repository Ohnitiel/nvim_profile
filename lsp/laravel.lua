vim.filetype.add({
    pattern = {
	['*.blade.php'] = 'blade',
    },
})
return {
    cmd = { vim.p.masonpath .. "bin/laravel-lsp" },
    filetypes = { "php", "blade" },
}


