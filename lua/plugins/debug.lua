return {
    "mfussenegger/nvim-dap",

    dependencies = {
        "sontungexpt/better-diagnostic-virtual-text",
    },

    config = function()
        require("better-diagnostic-virtual-text").setup({
            inline = true
        })
    end
}
