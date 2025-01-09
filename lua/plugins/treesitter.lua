return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
	require("nvim-treesitter.configs").setup({
	    auto_install = false,
	    highlight = {
		enabled = true,
		disable = function(lang, buf)
		    local max_file_size = 100 * 1024  -- 100KB
		    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
		    if ok and stats and stats.size > max_file_size then
			return true
		    end
		end
	    },
	    additional_vim_regex_highlighting = false,
	})
    end,
}
