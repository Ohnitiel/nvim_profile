return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		
		configs.setup({
			ensure_installed = {
				"lua", "typescript", "html", "bash", "css",
				"json", "php", "python", "scss", "sql", "toml",
				"javascript", "yaml", "dockerfile",
			},
			sync_installed = false,
			highlight = { enable = true },
			indent = {enable = true },
		})
	end
}
