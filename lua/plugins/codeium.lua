return {
    "Exafunction/codeium.nvim",

    config = function()
        require("codeium").setup({
            config_path = os.getenv("HOME") .. "/.config/codeium/config.json"
        })
    end,

    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp",
    }
}
