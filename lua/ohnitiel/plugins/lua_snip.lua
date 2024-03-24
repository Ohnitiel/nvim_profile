return {
    "L3MON4D3/LuaSnip",
    config = function()
        require("luasnip.loaders.from_lua").load({ path = "sql" })
    end
}
