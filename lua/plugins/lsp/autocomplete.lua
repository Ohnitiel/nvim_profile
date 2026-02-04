vim.api.nvim_create_autocmd("PackChanged", {
    desc = "Build blink.cmp fuzzy finder",
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind

        if name == "blink.cmp" and (kind == "install" or kind == "update") then
            vim.cmd("[[ BlinkCmp build ]]")
        end
    end,
})

vim.pack.add(
    { { src = "https://github.com/Saghen/blink.cmp", }, },
    { confirm = false, }
)
vim.pack.add({ "https://github.com/rafamadriz/friendly-snippets", })
vim.pack.add(
    { {
        src = "https://github.com/monkoose/neocodeium",
    } },
    { confirm = false, }
)

local cmp = require("blink.cmp")
local ai = require("neocodeium")

cmp.setup({
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
    completion = {
        menu = {
            auto_show = function(ctx)
                return ctx.mode ~= 'default'
            end,
        },
    },
})

vim.api.nvim_create_autocmd('User', {
    pattern = "BlinkCmpMenuOpen",
    callback = function()
        ai.clear()
    end,
})

ai.setup({
    filter = function()
        return not cmp.is_visible()
    end
})
vim.keymap.set("i", "<A-f>", ai.accept)
vim.keymap.set("i", "<A-c>", ai.clear)
vim.keymap.set("i", "<A-n>", ai.cycle)
