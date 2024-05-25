vim.opt.expandtab = true
vim.opt.shiftwidth = 4

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.relativenumber = true
vim.opt.number = true

vim.opt.undofile = true

vim.opt.colorcolumn = "80"

vim.opt.inccommand = "split"

vim.opt.shada = { "'10", "<0", "s10", "h" }


local json = require("functions.json")


local db_file = io.input(os.getenv("HOME") .. "/.dotfiles/databases.json")
local content = io.read("*a")
local databases = json.from_string(content)
io.close(db_file)

for _, v in pairs(databases) do
    databases = v
end

print(databases[1]['name'])
