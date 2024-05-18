return { {
    "lewis6991/gitsigns.nvim",

    requires = {
        'nvim-tree/nvim-web-devicons'
    },

    function()
        vim.opt.signcolumn = 'yes'

        require("gitsigns").setup({
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                local function map(mode, l, r, opts)
                    opts = opts or {}
                    opts.buffer = bufnr
                    vim.keymap.set(mode, l, r, opts)
                end

                map("n", "<leader>nh", function()
                    if vim.wo.diff then return "<leader>nh" end
                    vim.schedule(function() gs.next_hunk() end)
                    return "<Ignore>"
                end, { expr = true, desc = "Git go to next hunk" })

                map("n", "<leader>ph", function()
                    if vim.wo.diff then return "<leader>ph" end
                    vim.schedule(function() gs.prev_hunk() end)
                    return "<Ignore>"
                end, { expr = true, desc = "Git go to previous hunk" })

                map("n", "<leader>hs", gs.stage_hunk, { desc = "Git stage hunk" })
                map("n", "<leader>hr", gs.reset_hunk, { desc = "Git reset hunk" })
                map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Git undo stage hunk" })
                map("n", "<leader>hp", gs.preview_hunk, { desc = "Git preview hunk" })
                map("n", "<leader>hS", gs.stage_buffer, { desc = "Git stage buffer" })
                map("n", "<leader>hR", gs.reset_buffer, { desc = "Git stage buffer" })
                map("n", "<leader>hD", gs.diffthis, { desc = "Git diff buffer" })
                map("n", "<leader>hd", function()
                    gs.diffthis('~' .. vim.v.count)
                end, { desc = "Git diff buffer with head == count" })
                map("n", "<leader>td", gs.toggle_deleted, { desc = "Git toggle deleted" })
                map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Git toggle current line blame" })
            end
        })
    end,

    -- setup = function()
    --     vim.g.gitsign_config = {
    --         current_line_blame = true,
    --
    --         opts = {
    --             signs = {
    --                 add = { text = '+' },
    --                 change = { text = '~' },
    --                 delete = { text = '_' },
    --                 topdelete = { text = '‾' },
    --                 changedelete = { text = 'x' },
    --             },
    --         }
    --     }
    -- end,
} }
