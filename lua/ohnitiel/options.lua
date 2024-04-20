-- Tabs to spaces and 4 space width tabs
vim.opt.expandtab = true;
vim.opt.shiftwidth = 4;

-- Don't highlight all searchs, incrementally highlight
vim.opt.hlsearch = false;
vim.opt.incsearch = true;

-- Line numbers and relativenumber
vim.opt.relativenumber = true;
vim.opt.number = true;


vim.opt.timeoutlen = 250;

-- Mark column 80
vim.opt.colorcolumn = "80";
vim.opt.cursorcolumn = true;


-- No need with lsp_lines
vim.diagnostic.config({ virtual_text = false, })

vim.opt.undofile = true
vim.opt.signcolumn = 'yes'
