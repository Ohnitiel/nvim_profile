return { {
    "kndndrj/nvim-dbee",

    requires = {
        "MunifTanjim/nui.nvim",
    },

    setup = function()
        require("dbee").install()
    end,

    function()
        require("dbee").setup({
            sources = {
                require("dbee.sources").FileSource:new(os.getenv("HOME") .. ".local/dbee/databases.json"),
            }
        })
    end
} }
