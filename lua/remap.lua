vim.g.mapleader = " "

vim.keymap.set("n", "<leader>'", vim.cmd.Ex, { desc = "Open Netrw" })

vim.keymap.set("n", "<leader>w", vim.cmd.write, { desc = "Save buffer" })
vim.keymap.set("n", "<leader>q", vim.cmd.quit, { desc = "Quit buffer" })

vim.keymap.set("v", "<leader>y", [["+y]], { desc = "Copy selection" })
vim.keymap.set({ "n", "v" }, "<leader>Y", [[ggVG"+y]], { desc = "Copy buffer" })
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Put register contents" })

vim.keymap.set("n", "<leader>sw", [[:%s/\<<C-r><C-W>\>/<C-r><C-W>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>sw", [["0y:%s/<C-r>0//gI<Left><Left><Left>]])

vim.keymap.set("n", "[f", function() vim.cmd("cprev") end, { desc = "Quickfix previous item" })
vim.keymap.set("n", "]f", function() vim.cmd("cnext") end, { desc = "Quickfix next item" })
vim.keymap.set("n", "[F", function() vim.cmd("cpfile") end, { desc = "Quickfix previous file" })
vim.keymap.set("n", "]F", function() vim.cmd("cnfile") end, { desc = "Quickfix next file" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })
