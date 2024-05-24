return {
    "nvim-treesitter/nvim-treesitter",

    build = ':TSUpdate',

    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua", "typescript", "html", "bash", "css",
                "json", "php", "python", "scss", "sql", "toml",
                "javascript", "yaml", "dockerfile", "vimdoc",
                "hurl", "markdown", "markdown_inline"
            },
            highlight = {
                enable = true,
                disable = function(_, buf)
                    local max_filesize = 5 * 1024 * 1024 -- 5MB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
                additional_vim_regex_highlighting = false,
            },
        })
    end
}
