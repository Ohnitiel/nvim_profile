vim.api.nvim_create_autocmd('PackChanged', {
    desc = "Run TSUpdate when treesitter updates",
    callback = function(args)
        local spec = args.data.spec
        local events = { update = true, install = true, delete = false }
        if not spec or spec.name ~= "nvim-treesitter" then
            return
        end
        if events[args.data.kind] then
            vim.notify("Treesitter updated, running TSUpdate")
            vim.cmd("TSUpdate")
        end
    end,
})

vim.pack.add(
    { {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        version = "main",
    } },
    { confirm = false }
)

require("nvim-treesitter.config").setup({
    auto_install = false,
    highlight = {
        enabled = true,
        disable = function(lang, buf)
            local max_file_size = 100 * 1024 -- 100KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_file_size then
                return true
            end
        end
    },
    additional_vim_regex_highlighting = false,
})
