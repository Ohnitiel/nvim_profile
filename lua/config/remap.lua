vim.g.mapleader = " "

vim.keymap.set("n", "-", vim.cmd.Ex)
vim.keymap.set("n", "<leader>q", vim.cmd.quit)
vim.keymap.set("n", "<leader>w", vim.cmd.write)

vim.keymap.set("v", "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [[:% y +<CR>]])
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
    local vstart = vim.fn.getpos("'<")
    local vend = vim.fn.getpos("'>")

    local line_start = vstart[2]
    local line_end = vend[2]
    local line = vim.fn.getline(line_start, line_end)
    if type(line) == "table" then
     line = table.concat(line, "\\n")
    end
    local repl = string.gsub(line, "\\n", "\\r")

    return ":%s/" .. line .. "/" .. repl .. "/gI<Left><Left><Left>"
end, {expr = true})
-- [["9y:%s/<C-r>9//gI<Left><Left><Left>]])

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
