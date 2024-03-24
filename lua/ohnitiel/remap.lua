vim.g.mapleader = " "
vim.keymap.set("n", "<leader><Esc>", vim.cmd.Ex, { desc = "Open Netrw" })
vim.keymap.set("n", "<leader>'", vim.cmd.Ex, { desc = "Open Netrw" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Center screen on cursor when moving pages or searching
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "}", "}zzzv")
vim.keymap.set("n", "{", "{zzzv")
vim.keymap.set("n", "[m", "[mzzzv")
vim.keymap.set("n", "]m", "]mzzzv")
vim.keymap.set("n", "[M", "[Mzzzv")
vim.keymap.set("n", "]M", "]Mzzzv")

-- Copy and yank related stuff
vim.keymap.set("v", "<leader>y", [["+y]], { desc = "Copy selection" })
vim.keymap.set("n", "<leader>Y", [[gg0VG$"+y]], { desc = "Copy entire buffer" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Put without yank" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>S", [[:%s/\<<C-r><C-W>\>/<C-r><C-W>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>[", [[^]], { desc = "Begin of line" })
vim.keymap.set("n", "<leader>w", vim.cmd.write, { desc = "Save buffer" })
vim.keymap.set("n", "<leader>W", vim.cmd.wall, { desc = "Save all buffers" })
vim.keymap.set("n", "<leader>x", vim.cmd.quit, { desc = "Quit Nvim" })
vim.keymap.set("n", "<leader>X", vim.cmd.quitall, { desc = "Quit All Nvim" })
