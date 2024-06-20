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

vim.cmd([[
let g:clipboard = {
\ 'name': 'WSL',
\ 'copy': {
\    '+':'win32yank.exe -i',
\    '*':'win32yank.exe -i'
\ },
\   'paste': {
\      '+': 'win32yank.exe -o',
\      '*': 'win32yank.exe -o',
\   },
\   'cache_enabled': 0,
\ }
]]
)
