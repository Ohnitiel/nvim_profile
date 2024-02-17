local lspzero = require('lsp-zero')

lspzero.on_attach(function(client, bufnr)
	lspzero.default_keymaps({buffer = bufnr})
end)

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"docker_compose_language_service",
		"dockerls",
		"ruff_lsp",
		"pyright",
		"lua_ls",
		"intelephense",
	},
	handlers = {
		lspzero.default_setup,
	},
})
