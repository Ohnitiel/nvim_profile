require("nvim-web-devicons").setup()
require("telescope").load_extension("ui-select")
require("telescope").load_extension("telescope-tabs")

local telescope_tabs = require("telescope-tabs")
telescope_tabs.setup()

require("oil").setup({
    view_options = {
        show_hidden = true,
        case_sensitive = true,
        natural_order = fast,
    },
})
require("koda").setup()

vim.cmd("colorscheme koda-moss")

vim.keymap.set("n", "-", [[:Oil <CR>]])
vim.keymap.set("n", "g<Tab>", telescope_tabs.go_to_previous)
