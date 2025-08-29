require("plugins.lsp.autocomplete")
require("plugins.lsp.formatter")
require("plugins.lsp.debugger")

vim.api.nvim_create_autocmd("LSPAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if not client then
            return
        end

        vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

        vim.keymap.set("n", "grd", vim.lsp.buf.definition, { buffer = ev.buf })
        vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { buffer = ev.buf })
    end,
})
