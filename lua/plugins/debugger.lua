return {
    "mfussenegger/nvim-dap",

    dependencies = {
        "theHamsta/nvim-dap-virtual-text"
    },

    config = function()
        local dap = require("dap")
        dap.adapters.python = {
            type = "executable",
            command = "python3",
            args = { "-m", "debugpy.adapter" }
        }
        require("nvim-dap-virtual-text").setup()
    end
}
