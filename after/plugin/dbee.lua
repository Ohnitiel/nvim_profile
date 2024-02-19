local dbee = require("dbee")
local home = (os.getenv("HOME") ~= nil or os.getenv("USERPROFILE"))

dbee.setup({
    sources = {
        require("dbee.sources").FileSource:new(home .. "/dbee/db.json"),
    },
})

vim.keymap.set("n", "<leader>o", function() dbee.open() end)
vim.keymap.set("n", "<leader>q", function() dbee.close() end)
