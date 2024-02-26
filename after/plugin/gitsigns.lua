require("gitsigns").setup({
    current_line_blame = true,
    current_line_blame_opts = {
        delay = 300,
        virt_text_pos = 'overlay',
    },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        map("n", "<leader>g-", function() gs.diffthis('~') end)
        map("n", "<leader>hu", gs.preview_hunk)
    end
})