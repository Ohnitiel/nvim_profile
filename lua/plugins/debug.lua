return {
    "mfussenegger/nvim-dap",

    dependencies = {
        "theHamsta/nvim-dap-virtual-text",
        "igorlfs/nvim-dap-view",
    },

    config = function()
        require("nvim-dap-virtual-text").setup()
    end
}
