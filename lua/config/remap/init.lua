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
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "x", false)
    local _, start_row, start_col, _ = unpack(vim.fn.getpos("'<"))
    local _, end_row, end_col, _ = unpack(vim.fn.getpos("'>"))

    local lines = vim.api.nvim_buf_get_text(0, start_row - 1, start_col - 1, end_row - 1, end_col, {})
    local selected_text = table.concat(lines, "\n")
    local escaped_text = vim.fn.escape(selected_text, "\\/.*$^~[]")
    escaped_text = escaped_text:gsub("\n", "\\n")

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
