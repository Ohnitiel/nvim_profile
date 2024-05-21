return {{
    "MeanderingProgrammer/markdown.nvim",

    function()
        require("render-markdown").setup()
    end,

    requires = { "nvim-treesitter/nvim-treesitter" },
}}
