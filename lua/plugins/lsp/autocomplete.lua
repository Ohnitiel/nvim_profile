vim.api.nvim_create_autocmd("PackChanged", {
    desc = "Build blink.cmp fuzzy finder",
    callback = function(args)
        -- local spec = args.data.spec
        -- local events = { update = true, install = true, delete = false }
        -- if not spec or spec.name ~= "blink.cmp" then
        --     return
        -- end
        -- if events[args.data.kind] then
        --     vim.notify("blink.cmp updated, building fuzzy finder")
        --     vim.schedule(function()
        --         local source_dir = args.data.path
        --         os.execute("cargo build --release --target-dir" .. source_dir)
        --     end)
        -- end
        vim.cmd("[[ BlinkCmp build ]]")
    end,
})

vim.pack.add(
    { { src = "https://github.com/Saghen/blink.cmp", }, },
    { confirm = false, }
)
vim.pack.add({ "https://github.com/rafamadriz/friendly-snippets", })

require("blink.cmp").setup({
    cmdline = { enabled = true },
    sources = {
        per_filetype = {
            lua = { inherit_defaults = true, 'lazydev' }
        },
        providers = {
            lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                score_offset = 100,
                enabled = true
            },
        },
    },
})
