local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local sn = ls.snippet_node
local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { desc = "Next snippet jump" })
vim.keymap.set({ "i", "s" }, "<C-H>", function() ls.jump(-1) end, { desc = "Previous snippet jump" })
vim.keymap.set({ "i", "s" }, "<C-E>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { desc = "Choose snippet" })




ls.add_snippets("sql", {
    s("CREATE TABLE", {
        t("CREATE TABLE "), i(1, "table_name"), t({ " (",
        "\tid SERIAL,",
        "\tcreated_at TIMESTAMP DEFAULT NOW(),",
        "\tupdated_at TIMESTAMP DEFAULT NOW(),",
        "\tdeleted_at TIMESTAMP",
        ")" }),
    }),
    s("RLT TABLE", { sn(1, {
        t("CREATE TABLE rlt_"), i(1, "table1"), t("_"), i(2, "table2"), t({ " (",
        "\tid SERIAL,", "" }),
        f(function(args)
                return {
                    "\t" .. args[1][1] .. "_id INTEGER,",
                    "\t" .. args[2][1] .. "_id INTEGER,", ""
                }
            end,
            { 1, 2 }
        ),
        t({ "\tcreated_at TIMESTAMP DEFAULT NOW(),",
            "\tupdated_at TIMESTAMP DEFAULT NOW(),",
            "\tdeleted_at TIMESTAMP,", "",
        }),
        f(function(args)
                return {
                    "\tCONSTRAINT " ..
                    args[1][1] .. "_fk FOREIGN KEY (" .. args[1][1] .. "_id) REFERENCES " .. args[1][1] ..
                    "(id) ON DELETE CASCADE ON UPDATE CASCADE,",
                    "\tCONSTRAINT " ..
                    args[2][1] .. "_fk FOREIGN KEY (" .. args[2][1] .. "_id) REFERENCES " .. args[2][1] ..
                    " (id) ON DELETE CASCADE ON UPDATE CASCADE",
                    ")"
                }
            end,
            { 1, 2 }),
    }),
    })
})
