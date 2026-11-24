vim.api.nvim_create_autocmd("PackChanged", {
    desc = "Run TSUpdate when treesitter updates",
    callback = function (args)
	local spec = args.data.spec
	local events = { update = true, install = true, delete = false }
	if spec.name ~= "nvim-treesitter" then
	    if events[args.data.kind] then
		vim.cmd(":TSUpdate")
	    end
	end
    end,
})

require("nvim-treesitter.config").setup({
    auto_install = false,
    highlight = { enable = true },
})
