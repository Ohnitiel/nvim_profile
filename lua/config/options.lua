vim.opt.breakindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = '80'
vim.opt.columns = 84
vim.opt.undofile = true
vim.opt.undodir = os.getenv('HOME') .. '/.local/state/nvim/undo/'
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.shiftround = true
vim.opt.backup = true
vim.opt.backupdir = os.getenv('HOME') .. '/.local/state/nvim/backup/'
vim.opt.splitright = true
vim.opt.hlsearch = false

vim.p = {}
vim.p.masonpath = os.getenv('HOME') .. '/.local/share/nvim/mason/'

vim.api.nvim_set_hl(0, 'Normal', { bg = 'NONE' } )
