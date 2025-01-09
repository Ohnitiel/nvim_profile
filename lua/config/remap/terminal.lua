vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true })

local job_id = 0

local new_term = function()
    vim.cmd.vsplit()
    vim.cmd.wincmd("l")
    vim.cmd.terminal()

    job_id = vim.bo.channel
    vim.cmd.wincmd("j")
end

vim.keymap.set("n", "<leader>tt", new_term)

vim.keymap.set("n", "<C-g>", function()
    vim.fn.chansend(job_id, { "git status\r\n" })
end)

new_term()
