return {
    "lewis6991/gitsigns.nvim",

    config = function()
        require("gitsigns").setup({
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text_pos = "right_align",
                delay = 500,
            },
            current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        })
    end
}
