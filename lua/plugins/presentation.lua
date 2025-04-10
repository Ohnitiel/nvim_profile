return {
    "Ohnitiel/markdown_presentation.nvim",
    config = function()
        require("md_presentation").setup({
            title_separator = "^# ",
            slide_separator = "^## ",
            step_separator = "",
        })
    end,
}
