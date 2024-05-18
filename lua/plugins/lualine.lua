return { {
    "nvim-lualine/lualine.nvim",

    requires = {
        'nvim-tree/nvim-web-devicons'
    },

    function()
        require("lualine").setup({
            options = {
                icons_enabled = false,
                theme = "auto",
                section_separators = "",
                component_separators = "",
                globalstatus = true,
                refresh = {
                    statusline = 200,
                },
            },

            sections = {
                lualine_a = { "mode" },
                lualine_b = { "branch", "diff", "diagnostics" },
                lualine_c = { { "filename", path = 1 }, "filesize" },
                lualine_x = { "encoding", { "filetype", colored = true } },
                lualine_y = { "location" },
                lualine_z = { "" },
            },

            inactive_sections = {},
            extensions = {},
        })
    end
} }
