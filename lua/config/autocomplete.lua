local cmp = require("blink.cmp")
local ai = require("codeium")

cmp.setup({
	--    sources = {
	-- default = { "lsp", "path", "snippets", "buffer", "codeium" },
	-- providers = {
	--     codeium = { name = "Codeium", module = "codeium.blink", async = true }
	-- }
	--    },
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
    enable_cmp_source = false,
    virtual_text = {
	enabled = true,
	key_bindings = {
	    accept = "<M-f>",
	    next = "<M-n>",
	    prev = "<M-p>",
	    clear = "<M-c>",
	},
    },
    filter = function()
        return not cmp.is_visible()
    end
})
