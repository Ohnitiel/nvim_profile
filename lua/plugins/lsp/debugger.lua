vim.pack.add(
    { {
        src = "https://github.com/folke/lazydev.nvim"
    } },
    { confirm = false }
)
vim.pack.add(
    { {
        src = "https://github.com/mfussenegger/nvim-dap",
        name = "dap",
    } },
    { confirm = false }
)
vim.pack.add(
    { {
        src = "https://github.com/theHamsta/nvim-dap-virtual-text",
    } },
    { confirm = false }
)
vim.pack.add(
    { {
        src = "https://github.com/rcarriga/nvim-dap-ui",
        name = "dapui"
    } },
    { confirm = false }
)
vim.pack.add(
    { {
        src = "https://github.com/nvim-neotest/nvim-nio",
        name = "nio"
    } },
    { confirm = false }
)

require("dapui").setup()
require("nvim-dap-virtual-text").setup()
require("lazydev").setup({
    library = { "nvim-dap-ui" },
})

local dap, dapui = require("dap"), require("dapui")
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

vim.keymap.set("v", "<M-k>", function()
    require("dapui").eval()
end)

vim.keymap.set("n", "<M-f>", function()
    require("dapui").float_element()
end)
