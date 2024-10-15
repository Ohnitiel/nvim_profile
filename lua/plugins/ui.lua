return {
    {
    "rafamadriz/neon",

    priority = 1000,
    lazy = false,

    config = function()
        vim.g.neon_style = "dark"
        vim.cmd.colorscheme("neon")
    end,
},
{
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
}
}
