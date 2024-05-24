return {
    "nvim-lualine/lualine.nvim",

    dependencies = {
        'nvim-tree/nvim-web-devicons'
    },

    config = {
        options = {
            icons_enabled = false,
            section_separators = "",
            component_separators = "",
            globalstatus = true,
            refresh = {
                statusline = 1000,
            },
        },

        sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = { { "filename", path = 1 } },
            lualine_x = {
                "encoding",
                { "filetype", colored = true, icon_only = true } },
            lualine_y = { "location" },
            lualine_z = { "" },
        },

        inactive_sections = {},
        extensions = {},
    }
}
