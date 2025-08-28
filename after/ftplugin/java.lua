local dap = require("dap")

dap.adapters.java = function(callback)
    callback({
        type = 'server',
        host = '127.0.0.1',
        port = 8787
    })
end

-- dap.adapters.java = {
--     type = "executable",
--     command = "java",
--     args = { "-jar", vim.p.masonpath .. "packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-0.53.2.jar"},
--
-- }

dap.configurations.java = {
    type = "java",
    request = "attach",
    name = "Debug (Attach)",
    hostName = "127.0.0.1",
    port = 8787,
}
