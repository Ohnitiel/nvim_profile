gh = function(x) return 'https://github.com/' .. x end
cd = function(x) return 'https://codeberg.org/' .. x end

vim.api.nvim_create_autocmd("PackChanged", {
    desc = "Build blink.cmp fuzzy finder",
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind

        if name == "blink.cmp" and (kind == "install" or kind == "update") then
	    require("blink.cmp").build():pwait()
        end
    end,
})

vim.pack.add(
    {
	{ src = gh("nvim-lua/plenary.nvim") },
	{ src = gh("nvim-tree/nvim-web-devicons") },
	{ src = gh("nvim-telescope/telescope.nvim") },
	{ src = gh("nvim-telescope/telescope-ui-select.nvim") },
	{ src = gh("nvim-treesitter/nvim-treesitter") },
	{ src = gh("chrisgrieser/nvim-tinygit") },
	{ src = gh("stevearc/oil.nvim") },
	{ src = gh("Saghen/blink.lib"), },
	{ src = gh("Saghen/blink.cmp"), },
	{ src = gh("Exafunction/windsurf.nvim") },
	{ src = gh("stevearc/conform.nvim") },
	{ src = gh("folke/lazydev.nvim") },
	{ src = gh("mason-org/mason.nvim") },
	{ src = gh("Senal-D-A-Gunaratna/swapson.nvim") },
	{ src = gh("oskarnurm/koda.nvim") },  -- colorscheme
	{ src = cd("javy/nvim-popcorn") },
	{ src = cd("javy/nvim-spinetta") },
	{ src = cd("javy/nvim-dbeer") },
	{ src = cd("LukasPietzschmann/telescope-tabs") },
    },
    { confirm = false }
)
