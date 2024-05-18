return { {
    "Exafunction/codeium.nvim",

    function()
        require("codeium").setup({
            config_path = os.getenv("HOME") .. "/.config/codeium/config.json"
        })
    end,

    requires = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    }
} }
