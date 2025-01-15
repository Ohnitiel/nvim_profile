vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { noremap = true })

local job_id = 0
local bufnr
local winid

local toggle_term = function()
    if job_id ~= 0 then
        local open_term = vim.fn.len(
            vim.api.nvim_exec2(
                "filter /term:/ ls a",
                { output = true }
            ).output
        )
        if open_term ~= 0 then
            vim.api.nvim_win_hide(winid)
        else
            vim.api.nvim_open_win(bufnr, false, {
                split = 'right',
                win = 0
            })
            vim.cmd.wincmd("l")
            winid = vim.api.nvim_tabpage_get_win(0)
        end
    else
        vim.cmd.vsplit()
        vim.cmd.wincmd("l")
        vim.cmd.terminal()
        bufnr = vim.fn.bufnr("%")
        winid = vim.api.nvim_tabpage_get_win(0)

        job_id = vim.bo.channel
        vim.cmd.wincmd("j")
    end
end

vim.keymap.set("n", "<leader>tt", toggle_term)

vim.keymap.set("n", "<C-g>", function()
    vim.fn.chansend(job_id, { "git status\r\n" })
end)

vim.api.nvim_create_user_command("Git", function(opts)
    local args = opts.fargs
    if args[1] == "Add" then
        vim.fn.chansend(job_id, { "git add .\r\n" })
    end

    if args[1] == "Log" then
        vim.fn.chansend(job_id, { "git log --oneline --graph --parents .\r\n" })
    end

    if args[1] == "Push" then
        vim.fn.chansend(job_id, { "git push\r\n" })
    end

    if args[1] == "Pull" then
        vim.fn.chansend(job_id, { "git pull\r\n" })
    end

    if args[1] == "Commit" then
        local message = args[2]
        if message == nil then
            message = vim.fn.input("Commit message: ")
        end
        vim.fn.chansend(job_id, { "git commit -m \"" .. message .. "\" \r\n" })
    end
    vim.api.nvim_win_call(winid, function()
        vim.cmd("norm G")
    end)
end, {
    nargs = 1,
    complete = function()
        return { "Add", "Log", "Push", "Pull", "Commit" }
    end
})
