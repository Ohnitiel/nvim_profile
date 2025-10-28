vim.diagnostic.config({
    virtual_text = {
        format = function(diagnostic)
            local icons = {}
            icons[vim.diagnostic.severity.ERROR] = "  "
            icons[vim.diagnostic.severity.WARN] = "  "
            icons[vim.diagnostic.severity.INFO] = "  "
            icons[vim.diagnostic.severity.HINT] = "  "
            return icons[diagnostic.severity] .. diagnostic.message
        end,
        spacing = 2,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true
})

