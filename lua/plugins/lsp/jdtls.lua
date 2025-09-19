vim.pack.add(
    { {
        src = "https://github.com/mfussenegger/nvim-jdtls",
        name = "jdtls",
    } },
    { confirm = false }
)

local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = vim.fs.normalize('~/.local/share/jdtls-workspaces/' .. project_name)

vim.lsp.config("jdtls", {
    cmd = {
        "/opt/lsp/jdtls/bin/jdtls",
        "-data", workspace_dir
    },
    filetypes = { "java" },
    settings = {
        java = {
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-1.8",
                        path = "/opt/java_1.8",
                    },
                },
            },
        },
    },
    init_options = {
        bundles = {
            vim.fn.glob(
                "/opt/dap/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
        }
    },
})
