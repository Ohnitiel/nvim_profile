vim.pack.add(
    { { src = "https://github.com/tanvirtin/vgit.nvim" } },
    { confirm = false }
)

local vgit = require("vgit")
vgit.setup()
vim.cmd([[VGit toggle_live_blame]])

vim.keymap.set("n", "<leader>gd", vgit.project_diff_preview)
vim.keymap.set("n", "<leader>gb", vgit.toggle_live_blame)
