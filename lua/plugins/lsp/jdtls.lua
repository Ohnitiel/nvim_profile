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
    capabilities = {
        textDocument = {
            completion = { dynamicRegistration = false },
            hover = { dynamicRegistration = false } ,
        }
    },
    filetypes = { "java" },
    settings = {
        java = {

            implementationCodeLens = { enabled = false },
            referencesCodeLens = { enabled = false },
            references = { includeDecompiledSources = false },
            inlayHints = {
                parameterNames = { enabled = 'none' },
            },
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' },

            maven = {
                downloadSources = false,
                updateSnapshots = false
            },

            codeGeneration = {
                toString = {
                    template = '${object.className} [IGNORED]',
                    enabled = false,
                },
                hashCodeEquals = { useJava7Objects = false, enabled = false },
                useBlocks = false
            },

            completion = { enabled = false, },

            saveActions = { organizeImports = false },

            templates = {
                fileHeader = {},
                typeComment = {},
            },

            format = { enabled = false },

            organizeImports = { starThreshold = 99, staticStarThreshold = 99 },
            
            configuration = {
                updateBuildConfiguration = 'disabled',
                runtimes = {
                    {
                        name = "JavaSE-1.8",
                        path = "/opt/java_1.8",
                    },
                },
            },
        },
    },
    root_dir = vim.loop.cwd(),
    -- init_options = {
    --     bundles = {
    --         vim.fn.glob(
    --             "/opt/dap/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar")
    --     }
    -- },
})
