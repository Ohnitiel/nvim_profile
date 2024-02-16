local lspzero = require('lsp-zero')

lspzero.on_attach(function(client, bufnr)
	lspzero.default_keymaps({buffer = bufnr})
end)
