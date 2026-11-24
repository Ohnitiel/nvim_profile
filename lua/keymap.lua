vim.g.mapleader = " "

vim.keymap.set("n", "<leader>q", vim.cmd.quit)
vim.keymap.set("n", "<leader>w", vim.cmd.write)

vim.keymap.set("n", "<leader>y", ":% y +<CR>")
vim.keymap.set("v", "<leader>y", [["+y]])

vim.keymap.set("v", "p", [["_dP]])

vim.keymap.set("v", "K", function()
    local count = vim.v.count + 1
    if count == 1 then
        count = 2
    end
    return ":'<,'>m '<-" .. count .. "<CR>gv=gv"
end, { expr = true })
vim.keymap.set("v", "J", function()
    local count = vim.v.count
    if count == 0 then
        count = 1
    end
    return ":'<,'>m '>+" .. count .. "<CR>gv=gv"
end, { expr = true })


vim.keymap.set("n", "<leader>sw", [[:%s/\<<C-r><C-W>\>/<C-r><C-W>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>sw", function()
    local escaped_text = get_visual_selection()

    return ":%s/" .. escaped_text .. "/" .. escaped_text .. "/gI<Left><Left><Left>"
end, { expr = true })

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

vim.keymap.set("n", "<leader>tb", vim.cmd.tabnew)
